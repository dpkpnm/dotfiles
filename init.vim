call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim', { 'branch': 'master' }
	Plug 'mg979/vim-visual-multi'
	Plug 'codota/tabnine-vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'wellle/targets.vim'
	Plug 'morhetz/gruvbox'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch':'release'}
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-notes'
	Plug 'xolox/vim-session'
	Plug 'pangloss/vim-javascript'
	Plug 'easymotion/vim-easymotion'
	Plug 'kdheepak/lazygit.vim', {'branch':'nvim-v0.4.3'}
	Plug 'matze/vim-move'
	Plug 'pangloss/vim-javascript'
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'jparise/vim-graphql'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'diepm/vim-rest-console'
  Plug 'pechorin/any-jump.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
	Plug 'ervandew/supertab'
	Plug 'haya14busa/incsearch.vim'
	Plug 'haya14busa/vim-easyoperator-line'
	Plug 'airblade/vim-gitgutter'
	" Plug 'ruanyl/vim-gh-line'
	Plug 'alvan/vim-closetag'
	Plug 'inkarkat/vim-UnconditionalPaste'
	Plug 'chaoren/vim-wordmotion'
	Plug 'pbogut/fzf-mru.vim'
	Plug 'mattn/emmet-vim'
call plug#end()

augroup LuaHighlight
	autocmd!
	autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

"basic settings
set nocompatible
set nu
set hidden
set autoread
set nohlsearch
set noruler
set noswapfile
set nofoldenable
set incsearch
set noconfirm
set tabstop=2 softtabstop=2 shiftwidth=2
set background=dark
set cmdheight=1
set foldmethod=indent
set inccommand=split
set completeopt=longest,menuone
set ignorecase
set smartcase
set scrolloff=15
set clipboard=unnamedplus
syntax on
let g:context_enabled = 1

" shortcuts
inoremap jj <ESC>:w<cr>
map ee <esc>mA
map <silent> ec <esc>:bufdo bd!<cr>
map ea <esc>`A
map ei :e ~/dev/dotfiles/init.vim<cr>
map ex :bd!<cr> 
map ev :vsp<cr>:bp<cr>
map eo :only<cr>
nnoremap S diw"0P
map en :Note 032021<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader><leader> <Plug>(GitGutterNextHunk)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map f <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
noremap 8 *
noremap 5 %
noremap 5 ^ 
nnoremap <silent> - <esc>:FloatermNew --height=0.9 --width=0.9 lf<cr>
nnoremap c "_c
vnoremap c "_c
nnoremap d "_d
vnoremap d "_d
noremap <Leader>s :update<CR>
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui
nnoremap <silent><C-p> :FZF<cr>
nnoremap <silent><C-c> :FZFMru<cr>
nnoremap <silent><C-g> :Rg<cr>
nnoremap <silent><C-h> :History<cr>
nnoremap <silent><C-z> :LazyGit<cr>
nnoremap <silent><C-b> :Buffers<cr>
nnoremap <silent><C-f> :GF?<cr>
nnoremap <silent><C-a> :Bookmark<cr>
nnoremap <silent><C-q> :call fzf#run({'source': 'cat ~/dev/scripts/annotations.txt', 'sink': 'HandleFZF', 'options':'--with-nth 2..-1'})<cr>
nnoremap <silent><C-x> :call fzf#run({'source': 'git show --name-only --oneline', 'options':'--header-lines=1', 'sink':'e'})<cr>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:b#<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" map s <esc>:w<cr>
"autocomplete shortcuts
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Plugin configurations
let mapleader=" "
let g:move_key_modifier='C'
let g:notes_suffix='.txt'
let g:notes_directories=['~/dev/notes']
let g:notes_word_boundaries=1
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:minisnip_trigger='<C-c>'
let g:gruvbox_italic=1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'Comment', 'border':'sharp'} }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:EasyMotion_smartcase=1
let g:any_jump_grouping_enabled=1
let g:netrw_fastbrowse = 0

"Remvoe netrw when it sticks around with readonly
autocmd FileType netrw setl bufhidden=delete
syntax enable
colorscheme gruvbox
set background=dark
augroup PrettierFileDetect
  autocmd BufNewFile,BufReadPost *.vue setfiletype vue
augroup end

function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      1
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction
nmap <silent> ]c :call NextHunkAllBuffers()<CR>
nmap <silent> [c :call PrevHunkAllBuffers()<CR>


let g:netrw_banner=0
let g:netrw_list_hide='.*\.swp$'
let g:netrw_chgwin=1

function! HandleFZF(file)
  execute 'e' substitute(split(a:file," ")[0],'\','', 'g')
endfunction
command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)

function! Bookmark()
  " let curline = getline('.')
  " call inputsave()
  let name = input('Enter name: ')
	call writefile([ expand('%:p') . ' ' . name], "/Users/deepakpenmetsa/dev/scripts/annotations.txt","a")
  " call inputrestore()
  " call setline('.', curline . ' ' . name)
endfunction
command! Bookmark :call Bookmark()

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

noremap p gp
noremap P gP
noremap gp p
noremap gP P
noremap <leader>p o<Esc>p
noremap <leader><leader>p O<Esc>p
