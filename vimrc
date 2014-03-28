set nocompatible

" PLUGINS
" =======

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts=0
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-markdown'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_insertion=1

" vim-scripts repos
"Plugin 'Colour-Sampler-Pack'
Plugin 'Tagbar'
let g:tagbar_left = 1


" SETTINGS
" ========

" Appearance
"Remove all previous autocmds
autocmd!

set modelines=0

filetype plugin indent on

set background=dark

if &t_Co > 2 || has("gui_running")
    syntax on
endif

if has("gui_running") "||  &t_Co >= 256
    colorscheme jellybeans
endif

set autoread

" Filetype Support
autocmd BufNewFile,BufRead *.cl set filetype=opencl
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.tex set spell

" Behavior
set laststatus=2

set title
set ruler
set nocursorline
set showcmd
set showmode
set nonumber
set numberwidth=1
set shortmess=atToO

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
nnoremap j gj
nnoremap k gk

noremap <C-a> ^
noremap <C-e> $
noremap! <C-a> <home>
noremap! <C-e> <end>

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

let mapleader = ","

nmap <leader>s :!

nmap <leader>w :w<cr>
nmap <leader>d :bd<cr>
nmap <leader>ev :e! $MYVIMRC<cr>
nmap <silent> <leader>/ :nohlsearch<cr>

nmap ; :CtrlPBuffer<cr>
