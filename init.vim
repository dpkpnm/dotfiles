syntax on
filetype plugin indent on
set completeopt=menuone,noselect
set nu
set smartindent
set cmdheight=1
set expandtab
set nohlsearch
set noconfirm
set noruler
set autoread
set hidden
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
set inccommand=split
let g:netrw_fastbrowse = 0
autocmd FileType netrw setl bufhidden=delete
let g:netrw_banner=0
let g:netrw_list_hide='.*\.swp$'
let g:netrw_chgwin=1

let mapleader = " "

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :'<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'e

inoremap zz <esc>:w!<cr>
map zz <esc>:w!<cr>
map zs <esc>:so %<cr>
map zi <esc>:PlugInstall<cr>
map zc <esc>:PlugClean<cr>
map zt <Plug>window:quickfix:loop
map za :lua require'telescope.builtin'.find_files({previewer=false})<cr>
map zf <cmd>Telescope file_browser<cr>
map zr <cmd>Telescope live_grep<cr>
map zb <cmd>Telescope buffers<cr>
map zq <cmd>Telescope quickfix<cr>
map zg <cmd>Telescope git_status<cr>

nnoremap el <esc>:FloatermNew --height=0.9 --width=0.9 lf<cr>
" map ee <esc>::NvimTreeToggle<CR>
map ef <esc>:GF?<cr>
map eh <esc>:History<cr>
map eb <esc>:Buffers?<cr>
map ec <esc>:bufdo bd!<cr>
map ew ci)
map ez <esc>:LazyGit<cr>
map ep <esc>:FZF<cr>
map eg <esc>:Rg<cr>
map ea <esc>`A
map em <esc>mA
map ei :e ~/dev/dotfiles/init.vim<cr>
map ex :bd!<cr>
nmap eq <Plug>window:quickfix:loop
map eg :call fzf#run({'source': 'git show --name-only --oneline', 'options':'--header-lines=1', 'sink':'e'})<cr>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:b#<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

noremap p gp
noremap P gP
noremap gp p
noremap gP P
noremap <leader>p o<Esc>p
noremap <leader><leader>p O<Esc>p
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

function! HandleFZF(file)
  execute 'e' substitute(split(a:file," ")[0],'\','', 'g')
endfunction
command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)

function! Bookmark()
  let name = input('Enter name: ')
	call writefile([ expand('%:p') . ' ' . name], "/Users/deepakpenmetsa/dev/scripts/annotations.txt","a")
endfunction
command! Bookmark :call Bookmark()

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

noremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gf <esc>:AnyJump<cr> 
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>n
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
augroup luahighlight
	autocmd!
	autocmd textyankpost * silent! lua require'vim.highlight'.on_yank()
augroup end

call plug#begin('~/.vim/plugged')
  Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
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
  " Plug 'kyazdani42/nvim-tree.lua'
  Plug 'mattn/vim-lsp-icons'
  Plug 'ervandew/supertab'
  Plug 'drmingdrmer/vim-toggle-quickfix'
  Plug 'kdheepak/lazygit.vim', {'branch':'nvim-v0.4.3'}
  Plug 'pechorin/any-jump.vim'
  Plug 'matze/vim-move'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/popup.nvim'
call plug#end()
colorscheme gruvbox 
lua require'lspconfig'.tsserver.setup{}

let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.8
let g:any_jump_window_top_offset   = 2 

"transparency
hi Normal guibg=#222222 ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE ctermfg=NONE guifg=#222222
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
hi SignifySignDelete ctermfg=red  guifg=#ff0000 cterm=NONE gui=NONE
hi SignifySignChange ctermfg=yellow  guifg=#ffff00 cterm=NONE gui=NONE
hi Visual  guifg=#999999 guibg=#444444 gui=none
hi Pmenu guibg=#3b3b3b ctermbg=green

let g:move_key_modifier='c'
let g:any_jump_grouping_enabled = 1 
let g:any_jump_preview_lines_count = 1
let g:any_jump_max_search_results = 100
inoremap <silent><expr> <CSpace> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
hi Floaterm guibg=black
hi FloatermBorder guibg=black guifg=gray
