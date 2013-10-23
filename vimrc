set nocompatible
filetype off

"""
" Vundle
"""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle "gmarik/vundle"

"""
" Bundles
"""
" original repos on github
"Bundle "wincent/Command-T"
Bundle "kien/ctrlp.vim"
Bundle "Raimondi/delimitMate"
Bundle "fholgado/minibufexpl.vim"
"Bundle "kevinw/pyflakes-vim"
"Bundle "marijnh/tern_for_vim"
"Bundle "rstacruz/sparkup", {"rtp": "vim/"}
"Bundle "Lokaltog/vim-easymotion"
"Bundle "Shougo/unite.vim"
"Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-markdown"
"Bundle "tpope/vim-rails.git"
Bundle "tpope/vim-surround"
Bundle "Valloric/YouCompleteMe"

" vim-scripts repos
Bundle "Colour-Sampler-Pack"
"Bundle "neocomplcache"
Bundle "Tagbar"
"Bundle "TagHighlight"
"Bundle "Syntastic"
Bundle "VimClojure"
"Bundle "ZenCoding.vim"

" non github repos
"Bundle "git://git.wincent.com/command-t.git"

"""
" General
"""
"Remove all previous autocmds
autocmd!

"set nocompatible
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
autocmd bufwritepost $MYVIMRC source $MYVIMRC

"""
" Interface
"""
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
set noerrorbells

set nowrap
set textwidth=79
"set formatoptions=qrn1
set formatoptions-=t
"set colorcolumn=85

set wildmenu
set wildmode=list:longest

set cot=menu,longest,preview

"""
" Indentation
"""
set autoindent
set nosmartindent

set nojoinspaces
set nofoldenable

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

"""
" Search/Replace
"""
set ignorecase
set smartcase

set magic

set incsearch
set hlsearch

set gdefault

"""
" History and Backup
"""
set history=1000
set nobackup

"""
" Keybindings
"""
let mapleader = ","

map <F1> <nop>
map <left> <nop>
map <right> <nop>
map <down> <nop>
map <up> <nop>

"set pastetoggle=<leader>p

nnoremap j gj
nnoremap k gk

noremap <C-a> ^
noremap <C-e> $
noremap! <C-a> <home>
noremap! <C-e> <end>

nnoremap <silent> <C-tab> :bn<cr>
nnoremap <silent> <C-S-tab> :bp<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>s :!

nmap <leader>w :w<cr>
nmap <leader>d :bd<cr>
nmap <leader>ev :e! $MYVIMRC<cr>
nmap <silent> <leader>/ :nohlsearch<cr>

"Plugin keybindings
nmap <leader>g :TagbarToggle<cr>

"""
" Filetype Support
"""
autocmd BufNewFile,BufRead *.cl set filetype=opencl
autocmd BufNewFile,BufRead *.tex set spell

"""
" Bundle Options
"""
" Ack
" Bundle: https://github.com/mileszs/ack.vim

" CSApprox
" Bundle: https://github.com/vim-scripts/CSApprox

" Latex Suite
" Bundle: https://github.com/jcf/vim-latex
"let g:tex_flavor = "latex"
"let g:Tex_DefaultTargetFormat = "pdf"
"let g:Tex_CompileRule_pdf = "rubber -d $*"

" MiniBufExpl

" neocomplcache
"let g:neocomplcache_enable_at_startup = 1

" SuperTab
" Bundle: https://github.com/vim-scripts/SuperTab-continued.
" let g:SuperTabDefaultCompletionType = "context"

" Tagbar
let g:tagbar_left = 1

" YankRing
" Bundle: https://github.com/vim-scripts/YankRing.vim
" let g:yankring_history_dir = "$HOME/.vim"

" ZenCoding
"let g:user_zen_leader_key = "<leader>y"
