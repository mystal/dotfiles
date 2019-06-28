set nocompatible

" PLUGINS
" =======

call plug#begin('~/.vim/bundle')

Plug 'bling/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"Plug 'w0rp/ale'
"let g:ale_linters = {'rust': ['rls', 'cargo']}
"let g:ale_sign_error = '⮿'
"let g:ale_sign_info = '🛈'
"let g:ale_sign_warning = '⯅'
"let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
"let g:ale_rust_rls_executable = 'ra_lsp_server'
"let g:ale_rust_rls_toolchain = ''
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'OrangeT/vim-csharp'
" TODO: Replace ctrlp with fzf?
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
"Plug 'ryanoasis/vim-devicons'
Plug 'Lokaltog/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
"Plug 'junegunn/fzf.vim'
"Plug 'mhinz/vim-grepper'
Plug 'Yggdroot/indentLine'
"Plug 'airblade/vim-gitgutter'
"Plug 'sjl/gundo.vim'
"Plug 'tpope/vim-markdown'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
" Don't conceal syntax in Markdown files.
let g:vim_markdown_conceal = 0
"Plug 'klen/python-mode'
"Plug 'tpope/vim-sensible'
"Plug 'trusktr/seti.vim'
"Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
"Plug 'wellle/targets.vim'
Plug 'jacoborus/tender.vim'
"Plug 'lluchs/vim-wren'
"Plug 'Valloric/YouCompleteMe'
"let g:ycm_autoclose_preview_window_after_insertion=1
"Plug 'KabbAmine/zeavim.vim'

call plug#end()

" SETTINGS
" ========

" Appearance
"Remove all previous autocmds
autocmd!

set modelines=0

set mouse=a

" Enable true color support
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

syntax enable

set background=dark

"colorscheme base16-tomorrow-night
colorscheme one
"colorscheme onedark
"colorscheme tender

" Disable background color to use the transparent terminal background.
"hi Normal guibg=NONE ctermbg=NONE

let g:airline_theme='one'

set autoread
autocmd BufWinEnter * checktime

" Behavior
set laststatus=2

set updatetime=300

set title
set ruler
set nocursorline
set showcmd
set showmode
set nonumber
set numberwidth=1
set shortmess=atToOc

set nostartofline

set hidden

set visualbell

set nowrap
set textwidth=79
"set formatoptions=qrn1
set formatoptions-=tc

set wildmenu
set wildmode=list:longest

"set cot=menu,longest,preview

"""
" Indentation
"""
set autoindent
set nosmartindent

set nojoinspaces

" TODO: overwrite on file-type basis
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Search
set gdefault
set hlsearch
set ignorecase
set incsearch
set magic
set smartcase

" History and Backup
set history=1000
set nobackup

" Keybindings
nnoremap <silent> j gj
nnoremap <silent> k gk

noremap <C-a> ^
noremap <C-e> $
noremap! <C-a> <home>
noremap! <C-e> <end>

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Ale
"nmap <silent> J <Plug>(ale_next_wrap)
"nmap <silent> K <Plug>(ale_previous_wrap)
" coc.nvim
nmap <silent> J <Plug>(coc-diagnostic-next)
nmap <silent> K <Plug>(coc-diagnostic-prev)

let mapleader = ','

nmap <leader>s :!

nmap <leader>w :w<cr>
nmap <leader>d :bd<cr>
nmap <leader>ev :e! ~/.vimrc<cr>
nmap <silent> <leader>/ :nohlsearch<cr>

nmap ; :CtrlPBuffer<cr>

" Shortcuts for coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Filetype Support
"autocmd BufNewFile,BufRead *.cl set filetype=opencl
"autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.tex set spell
