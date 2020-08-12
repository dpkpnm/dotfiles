set nocompatible
syntax on
set number rnu
set selectmode+=mouse
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set nohlsearch
set scrolloff=15
set noswapfile
set nofoldenable 
set noerrorbells
set clipboard=unnamedplus
set mouse=
set t_Co=256
set background=dark
set backup writebackup backupdir=~/dev/backup
au BufWritePre * let &bex ='-'.strftime("%m%d%H%M")

call plug#begin('~/.vim/plugged')
  Plug 'fergdev/vim-cursor-hist'
  Plug 'bilalq/lite-dfm'
  Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-commentary'
  Plug 'justinmk/vim-dirvish'
    let dirvish_mode = ':sort ,^.*/,'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    let g:prettier#autoformat = 1
    let g:prettier#autoformat_require_pragma = 0
  Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_OPTS = '--layout=reverse'
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'highlight': 'Comment', 'border':'sharp'} }
  Plug 'antoinemadec/coc-fzf'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'pangloss/vim-javascript'    " JavaScript support
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'jparise/vim-graphql'        " GraphQL syntaxPlug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-session'
    let g:session_autosave='yes'
    let g:session_autoload='yes'
  Plug 'easymotion/vim-easymotion'
  Plug 'rhysd/git-messenger.vim'
  Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' } 
call plug#end()
 
syntax match notesQuestion /\(^\s*?.*\n\)\+/ contains=@notesInline
syntax match notesImportant /\(^\s*!.*\n\)\+/ contains=@notesInline
syntax match notesPriority /\(^\s*\*.*\n\)\+/ contains=@notesInline
syntax match notesAction /\(^\s*>.*\n\)\+/ contains=@notesInline
syntax match notesEvent /\(^\s*@.*\n\)\+/ contains=@notesInline
syntax match notesScheduled /\(^\s*<.*\n\)\+/ contains=@notesInline
let g:notes_suffix = '.txt'
let g:notes_directories = ['~/dev/notes']
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <cr> ((pumvisible())?("\<C-n><C-y>"):("\<cr>"))
let mapleader = " "
nmap s :w<cr>
map z mZ
map zz `Z
map tg :cd ~/dev/growers-ui/<cr>
map tn :cd ~/dev/notifications-api/<cr>
map ti :e ~/dev/dotfiles/init.vim<cr>
map tb :Buffers<cr>
map ts :w<cr>:so %<cr>
map th :History<cr>
map tl :LazyGit<cr>
map tt :bn<cr>
map tx :bd!<cr>   
map tv :vsp<cr>:bp<cr>
map to :only<cr>

inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
nnoremap <silent> <C-p> :FZF<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <C-g> :Rg<cr>
nnoremap <silent> <C-x> :BD<cr>
nnoremap <silent> <C-{> :bp<cr>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent>gm <Plug>(git-messenger)
nnoremap <silent> <C-n> :<C-u>exe v:count ? v:count . 'b' : 'b' . (bufloaded(0) ? '#' : 'n')<CR>
inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O
let g:EasyMotion_smartcase=1
map <leader> <Plug>(easymotion-prefix)
map <leader>f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f2)
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)
map  <leader>w <Plug>(easymotion-bd-w)
map <leader>z :LiteDFM<CR>
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
let g:camelcasemotion_key = '<leader>'

nmap <leader>o <Plug>(fzf-complete-path)	
colorscheme gruvbox
hi notesQuestion ctermfg=163
hi notesImportant ctermfg=9
hi notesPriority ctermfg=166
hi notesAction ctermfg=14
hi notesEvent ctermfg=10
hi notesScheduled ctermfg=11
