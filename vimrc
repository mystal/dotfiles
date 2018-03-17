set nocompatible

" PLUGINS
" =======

call plug#begin('~/.vim/bundle')

Plug 'bling/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'OrangeT/vim-csharp'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
Plug 'Raimondi/delimitMate'
Plug 'Lokaltog/vim-easymotion'
Plug 'editorconfig/editorconfig'
Plug 'Yggdroot/indentLine'
"Plug 'lambdatoast/elm.vim'
"Plug 'dag/vim-fish'
"Plug 'airblade/vim-gitgutter'
"Plug 'tikhomirov/vim-glsl'
"Plug 'fatih/vim-go'
"Plug 'sjl/gundo.vim'
"Plug 'udalov/kotlin-vim'
"Plug 'tpope/vim-markdown'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'klen/python-mode'
"Plug 'peterhoeg/vim-qml'
"Plug 'rust-lang/rust.vim'
"Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
"Plug 'keith/swift.vim'
"Plug 'wellle/targets.vim'
Plug 'jacoborus/tender.vim'
"Plug 'cespare/vim-toml'
Plug 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_insertion=1

" vim-scripts repos (DEPRECATED)
"Plug 'Colour-Sampler-Pack'
"Plug 'Tagbar'
"let g:tagbar_left = 1

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

set background=dark

syntax on

"colorscheme base16-tomorrow-night
colorscheme one
"colorscheme onedark
"colorscheme tender

set autoread
autocmd BufWinEnter * checktime

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

" Filetype Support
"autocmd BufNewFile,BufRead *.cl set filetype=opencl
"autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.tex set spell

autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType html,javascript,json setlocal shiftwidth=2 softtabstop=2 expandtab
