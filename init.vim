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
  Plug 'bkad/CamelCaseMotion' 
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
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
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
  Plug 'evanleck/vim-svelte'
Plug 'kdheepak/lazygit.nvim'
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
map tg :FZF ~/dev/growers-ui/<cr>
map tx :FZF ~/dev/backup/<cr>
map ti :e ~/dev/dotfiles/init.vim<cr>
map tb :Buffers<cr>
map ts :w<cr>:so %<cr>
map th :History<cr>
map tl :LazyGit<cr>
map tt :bn<cr>
" map ty set @+=expand("%") . ':' . line(".")<cr> 
map tx :bd!<cr>   
map tv :vsp<cr>:bp<cr>
map to :only<cr>
let g:EasyMotion_smartcase=1

map <leader> <Plug>(easymotion-prefix)
map <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f2)
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
let g:camelcasemotion_key = '<leader>'

function! OpenFloatingWin()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Normal
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
colorscheme gruvbox
hi notesQuestion ctermfg=163
hi notesImportant ctermfg=9
hi notesPriority ctermfg=166
hi notesAction ctermfg=14
hi notesEvent ctermfg=10
hi notesScheduled ctermfg=11

