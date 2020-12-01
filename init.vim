call plug#begin('~/.vim/plugged')
	Plug 'tckmn/vim-minisnip'
	Plug 'voldikss/vim-floaterm'
	Plug 'wellle/targets.vim'
	Plug 'wellle/context.vim'
	Plug 'morhetz/gruvbox'
	Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do':'./install --all'}
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch':'release'}
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-notes'
	Plug 'xolox/vim-session'
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
	Plug 'alvan/vim-closetag'
	Plug 'inkarkat/vim-UnconditionalPaste'
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
syntax on

" shortcuts
map ei :e ~/dev/dotfiles/init.vim<cr>
map ex :bd!<cr> 
map ev :vsp<cr>:bp<cr>
map eo :only<cr>
map en :Note 112020<cr>
nmap <leader><leader> <Plug>(GitGutterNextHunk)
nmap gp <Plug>(GitGutterPrevHunk)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map f <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
noremap 8 *
noremap 5 %
nnoremap <silent> - <esc>:FloatermNew --height=0.9 --width=0.9 lf<cr>

nnoremap <silent><C-p> :FZF<cr>
nnoremap <silent><C-g> :Rg<cr>
nnoremap <silent><C-h> :History<cr>
nnoremap <silent><C-z> :LazyGit<cr>
nnoremap <silent><C-b> :Buffers<cr>
nnoremap <silent><C-f> :GF?<cr>
map s <esc>:w<cr>
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
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:minisnip_trigger='<C-c>'
let g:gruvbox_italic=1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'Comment', 'border':'sharp'} }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:EasyMotion_smartcase=1
let g:any_jump_grouping_enabled=1

syntax enable
colorscheme gruvbox
set background=dark

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
