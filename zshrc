source "$HOME/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen load sindresorhus/pure async.zsh
  zgen load sindresorhus/pure pure.zsh

  zgen save
fi

fpath=(~/.zsh/functions $fpath)

unsetopt beep
unsetopt automenu
setopt histignoredups
setopt histignorespace

autoload -U compinit
compinit
autoload colors

bindkey -e

typeset -A key

if type keychain &> /dev/null; then
    eval $(keychain --eval --agents ssh -Q --quiet wheatley_rsa)
fi

if type virtualenvwrapper_lazy.sh &> /dev/null; then
    source virtualenvwrapper_lazy.sh
elif type virtualenvwrapper.sh &> /dev/null; then
    source virtualenvwrapper.sh
fi

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]] && bindkey "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]] && bindkey "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]] && bindkey "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]] && bindkey "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]] && bindkey "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]] && bindkey "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]] && bindkey "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]] && bindkey "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]] && bindkey "${key[PageUp]}"   beginning-of-history
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" end-of-history

if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval C_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval C_LIGHT_$color='%{$fg[${(L)color}]%}'
done
#C_CLEAR="%{$terminfo[sgr0]%}"

#PS1="${C_GREEN}[${C_YELLOW}%n${C_GREEN}@${C_CYAN}%m ${C_BLUE}%1~${C_GREEN}]%(!.${C_RED}#.$)${C_CLEAR} "
#RPS1="${C_GREEN}(${C_YELLOW}%*${C_GREEN})${C_CLEAR}"

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=${HISTSIZE}

alias grep="grep --color=always"
alias less="less -R"
if [[ $platform == "osx" ]]; then;
    alias ls="ls -G"
else
    alias ls="ls --color=always"
fi
alias visudo="sudo EDITOR=vim visudo"

# Disable terminal input start/stop
stty start ''
stty stop ''
stty -ixoff
