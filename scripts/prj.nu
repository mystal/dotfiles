#!/usr/bin/env nu

def main [] {
  # TODO: Check that fd and sk binaries are in $PATH

  let projects_dir = if PROJECTS_DIR in $env {
    $env.PROJECTS_DIR
  } else {
    "~/dev"
  } | path expand

  let git_dirs = ^fd -t d -H --no-ignore-vcs '^.git$' $projects_dir
    | lines
    | each {|e| $e | path relative-to $projects_dir | path dirname }

  let output = $git_dirs | to text | ^sk | complete
  if $output.exit_code > 0 {
    exit 1
  }

  let dir = $output.stdout | str trim -r
  print ($projects_dir | path join $dir)
}
