set nocompatible

" PLUGINS
" =======

call plug#begin('~/.vim/bundle')

" Required for some lua plugins (like crates.nvim)
Plug 'nvim-lua/plenary.nvim'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
Plug 'jiangmiao/auto-pairs'
" This plugin has a great overview of auto pairing plugins.
"Plug 'krasjet/auto.pairs'
Plug 'chriskempson/base16-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" let g:clap_layout = { 'relative': 'editor' }
" let g:clap_open_preview = 'never'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'Saecki/crates.nvim', { 'tag': 'v0.3.0' }
Plug 'OrangeT/vim-csharp'
"Plug 'ryanoasis/vim-devicons'
"Plug 'Lokaltog/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
"Plug 'mhinz/vim-grepper'
Plug 'Yggdroot/indentLine'
"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-markdown'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'simnalamburt/vim-mundo'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
" Plug 'meain/vim-package-info'
Plug 'sheerun/vim-polyglot'
" Don't conceal syntax in Markdown files.
let g:vim_markdown_conceal = 0
Plug 'ron-rs/ron.vim'
"Plug 'tpope/vim-sensible'
"Plug 'trusktr/seti.vim'
"Plug 'mhinz/vim-startify'
" An alternative to surround. Try it out.
"Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-surround'
"Plug 'wellle/targets.vim'
Plug 'jacoborus/tender.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'liuchengxu/vista.vim'
let g:vista_default_executive = 'coc'
Plug 'liuchengxu/vim-which-key'
"Plug 'lluchs/vim-wren'
"Plug 'KabbAmine/zeavim.vim'

call plug#end()

lua require('crates').setup()

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

" Reload files modified externally when vim gains focus.
" See: https://github.com/neovim/neovim/issues/1936#issuecomment-309311829
set autoread
autocmd FocusGained * checktime

" Behavior
set laststatus=2

set timeoutlen=500
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
set undofile
set history=1000
set nobackup

" Keybindings
nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>

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

nnoremap <silent> <leader> :WhichKey ','<CR>

nmap <leader>s :!

nmap <leader>w :w<cr>
nmap <leader>d :bd<cr>
nmap <leader>ev :e! ~/.vimrc<cr>
nmap <leader>t :Clap tags<cr>
nmap <silent> <leader>/ :nohlsearch<cr>

map <C-p> :Telescope find_files<cr>
nmap ; :Telescope buffers<cr>

" Shortcuts for coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> gk :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Filetype Support
autocmd BufNewFile,BufRead *.tex set spell
