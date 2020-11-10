set nocompatible 
set nu 
set hidden 
set autoread 
set nohlsearch 
set noruler 
set noswapfile 
set nofoldenable 
set noerrorbells 
set incsearch 
set ignorecase 
set noconfirm 
set tabstop=2 softtabstop=2 shiftwidth=2  
set t_Co=256 
set background=dark 
set cmdheight=1 
set selectmode+=mouse
set foldmethod=indent
set inccommand=split
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
syntax on
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
" set list
" clipboard
vnoremap <C-c> "+y
map <C-v> "+P
call plug#begin('~/.vim/plugged')
  Plug 'tckmn/vim-minisnip'
  Plug 'pechorin/any-jump.vim'
  Plug 'voldikss/vim-floaterm'
  Plug 'diepm/vim-rest-console'
  Plug 'wellle/targets.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-commentary'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'jparise/vim-graphql'        " GraphQL syntaxPlug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'easymotion/vim-easymotion'
  Plug 'rhysd/git-messenger.vim'
  Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' } 
  Plug 'ruanyl/vim-gh-line'
  " Plug 'machakann/vim-highlightedyank'
call plug#end()

let g:floaterm_keymap_toggle = '<c-t>'
let g:notes_suffix = '.txt'
let g:notes_directories = ['~/dev/notes']
let g:session_autosave='yes'
let g:session_autoload='yes'
let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment', 'border':'sharp'} }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let mapleader = " "

map ea :e ~/dev/notes/092020.txt<cr>
map eg :cd ~/dev/growers-ui/<cr>
map en :cd ~/dev/notifications-api/<cr>
map ei :e ~/dev/dotfiles/init.vim<cr>
map eb :Buffers<cr>
map es :w<cr>:so %<cr>
map eh :History<cr>
map et g;
map ex :bd!<cr>
map ev :vsp<cr>:bp<cr>
map eo only<cr>
map s :w<cr>
map <esc><esc> :w<cr>
nnoremap 8 *
nnoremap 5 %
nnoremap <Leader>x *``cgn
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

nnoremap <silent> <C-c> <esc>yy
nnoremap <silent> <C-e> <esc>:FloatermNew --height=0.8 --width=0.8 lf<cr>
nnoremap <silent> <C-v> <esc>p
nnoremap <silent> <C-s> <esc>:w<cr> 
nnoremap <silent> <C-p> :FZF<cr>
nnoremap <silent> <C-q> :q<cr>
nnoremap <silent> <C-h> :History<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-f> :GF?<cr>
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <C-\> <c-^>
inoremap <silent> <C-\> <esc><c-^>i
nnoremap <silent> <C-]> :bp<cr>
inoremap <silent> <C-]> :bp<cr>
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <leader>g :Rg <c-r><c-w><cr>
nnoremap <leader>e :bd!<cr>
nnoremap <silent> <C-g> :Rg <cr>
nnoremap <silent> <C-x> :bufdo bd<cr>
nnoremap <silent> - <esc>:FloatermNew --height=0.8 --width=0.8 lf<cr>
map / <Plug>(easymotion-sn)
map <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent>gm <Plug>(git-messenger)
nmap <leader>gf :GitGutterFold<cr>
let g:EasyMotion_smartcase=1
map f <Plug>(easymotion-overwin-f)
map t <Plug>(easymotion-overwin-t)
map <leader>z :LiteDFMToggle<CR>
"inoremap <expr> <C-t> fzf#vim#complete({'source': map(complete_info().items, "v:val.word")})
let g:minisnip_trigger = '<C-j>'
let g:gruvbox_italic=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
colorscheme gruvbox 
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap c "_c
vnoremap c "_c
