syntax on
filetype plugin indent on
set completeopt=menuone,noselect
set nu
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set nohlsearch
set nowrap
set termguicolors
set t_Co=256
set so=999
set smartcase ignorecase
set cursorline
set noswapfile
set noerrorbells
set clipboard=unnamedplus
set mouse=
set background=dark
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set scl=yes

let mapleader = " "
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'e
map <leader><leader> <esc>:w!<cr>
map ee <esc>::NvimTreeToggle<CR>
map ef <esc>:GF?<cr>
map eb <esc>:Buffers?<cr>
map ew <esc>ci)
map ez <esc>:LazyGit<cr>
map ep <esc>:FZF<cr>
map ea <esc>`A
map em <esc>mA
map ei :e ~/dev/dotfiles/init.vim<cr>
map ex :bd!<cr>
nmap eq <Plug>window:quickfix:loop
map eg :call fzf#run({'source': 'git show --name-only --oneline', 'options':'--header-lines=1', 'sink':'e'})<cr>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:b#<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

nnoremap c "_c
vnoremap c "_c
nnoremap d "_d
vnoremap d "_d
nnoremap <c-k> k
nnoremap <c-j> j
map <s-h> <Plug>(IndentWisePreviousEqualIndent)
map <s-j> <Plug>(IndentWiseNextEqualIndent)
map f <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
"copy current file path
nmap <silent>cp :let @" = expand("%")<cr>:let @+ = expand("%")<cr>

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
highlight link CompeDocumentation NormalFloat

let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
noremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>n
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

call plug#begin('~/.vim/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mhinz/vim-signify'
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  " Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 	
  Plug 'hrsh7th/nvim-compe'
  Plug 'morhetz/gruvbox'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'Yggdroot/indentLine'
  Plug 'easymotion/vim-easymotion'
  Plug 'prettier/vim-prettier'
  "regular installs
  Plug 'jeetsukumaran/vim-indentwise'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  let g:notes_suffix = '.txt'
  let g:notes_directories = ['~/dev/notes']
  Plug 'xolox/vim-session'
  let g:session_autosave='yes'
  let g:session_autoload='yes'
  Plug 'easymotion/vim-easymotion'
  Plug 'mg979/vim-visual-multi'
  Plug 'haya14busa/incsearch.vim'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'mattn/vim-lsp-icons'
  Plug 'ervandew/supertab'
  Plug 'drmingdrmer/vim-toggle-quickfix'
  Plug 'kdheepak/lazygit.vim', {'branch':'nvim-v0.4.3'}
call plug#end()
colorscheme gruvbox 
lua require'lspconfig'.tsserver.setup{}
" lua require('gitsigns').setup()
"transparency
hi Normal guibg=#222222 ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE ctermfg=NONE guifg=#222222
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
hi SignifySignDelete ctermfg=red  guifg=#ff0000 cterm=NONE gui=NONE
hi SignifySignChange ctermfg=yellow  guifg=#ffff00 cterm=NONE gui=NONE
