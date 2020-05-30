set nocompatible
filetype off
syntax on
filetype plugin indent on
set modelines=0
set number
set relativenumber
set ruler
set wrap
"set textwidth=79
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>
set shortmess=A
set noswapfile
"set linebreak
set noerrorbells visualbell t_vb=
set breakindent
set incsearch
set splitbelow
set splitright
set linespace=3
set mouse=r
"set list
"set showbreak=↪\ 
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
" set listchars=tab:.\ ,extends:›,precedes:‹,nbsp:·,trail:·

nnoremap j gj
nnoremap k gk

set hidden
set ttyfast
set laststatus=2

set showmode
set showcmd

set t_Co=256
set background=dark

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let dirvish_mode = ':sort ,^.*/,'
colorscheme monokai_pro

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
