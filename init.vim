set nu
set rnu
set tabstop=2
set expandtab
set clipboard=unnamedplus
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'thezeroalpha/vim-lf'
	Plug 'voldikss/vim-floaterm'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'wellle/targets.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3'}
	Plug 'machakann/vim-highlightedyank'
	Plug 'morhetz/gruvbox'
call plug#end()

let g:floaterm_keymap_toggle = '<c-t>'
let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment', 'border':'sharp'} }

" All mapping should be here
let mapleader = " "
nnoremap <silent> <C-e> <esc>:FloatermNew --height=0.8 --width=0.8 lf<cr>
nnoremap <silent> <C-p> :FZF<cr>
nnoremap <silent> <C-h> :History<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-f> :GF?<cr
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <C-s> :w<cr> :so %<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
nnoremap <leader>e :bd!<cr>
nnoremap <leader><leader> <C-^>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

let g:gruvbox_italic=1
colorscheme gruvbox
