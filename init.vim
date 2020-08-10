set nocompatible
syntax on
set number rnu
set autoread
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set nohlsearch
set scrolloff=15
set noswapfile
set nofoldenable 
set noerrorbells
set updatetime=2
set shortmess+=c
set signcolumn=yes
set clipboard=unnamedplus
set bufhidden=hide
set hidden
set mouse=
set t_Co=256
set path=.,src,node_nodules
set suffixesadd=.js,.jsx,.ts,.tsx
set background=dark
set backup writebackup backupdir=~/dev/backup
set cmdheight=1
au BufWritePre * let &bex ='-'.strftime("%m%d%H%M")

call plug#begin('~/.vim/plugged')
  Plug 'chuling/equinusocio-material.vim'
  Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'morhetz/gruvbox'
  Plug 'tomtom/tcomment_vim'
  Plug 'justinmk/vim-dirvish'
    let dirvish_mode = ':sort ,^.*/,'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_OPTS = '--layout=reverse'
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
  Plug 'antoinemadec/coc-fzf'
	Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
	Plug 'pangloss/vim-javascript'
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'jparise/vim-graphql'     
	Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-session'
    let g:session_autosave='yes'
    let g:session_autoload='yes'
  Plug 'easymotion/vim-easymotion'
  Plug 'ervandew/supertab' 
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
  Plug 'diepm/vim-rest-console'
  Plug 'machakann/vim-highlightedyank'
  Plug 'ruanyl/vim-gh-line'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'romainl/vim-qf'
  Plug 'airblade/vim-rooter'
  Plug 'bkad/CamelCaseMotion'
call plug#end()
 
syntax match notesQuestion /\(^\s*?.*\n\)\+/ contains=@notesInline
syntax match notesImportant /\(^\s*!.*\n\)\+/ contains=@notesInline
syntax match notesPriority /\(^\s*\*.*\n\)\+/ contains=@notesInline
syntax match notesAction /\(^\s*>.*\n\)\+/ contains=@notesInline
syntax match notesEvent /\(^\s*@.*\n\)\+/ contains=@notesInline
syntax match notesScheduled /\(^\s*<.*\n\)\+/ contains=@notesInline
let g:notes_suffix = '.txt'
let g:notes_directories = ['~/dev/notes']

let mapleader = " "
nmap s :w<cr>
map z mZ
map zz `Z
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
map tg :cd ~/dev/growers-ui/<cr>
map tn :cd ~/dev/notifications-api/<cr>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR> 
nnoremap <silent> <C-p> :FZF<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <C-g> :Rg<cr>
nnoremap <silent> <C-x> :BD<cr>
nnoremap <silent> <C-{> :bp<cr>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

map ti :e ~/dev/dotfiles/init.vim<cr>
map tb :Buffers<cr>
map ts :w<cr>:so %<cr>
map th :History<cr>
map tl :LazyGit<cr>
map tt :bn<cr>
map tx :bd!<cr>   
map tv :vsp<cr>:bp<cr>
map to :only<cr>
nnoremap <silent> <C-n> :<C-u>exe v:count ? v:count . 'b' : 'b' . (bufloaded(0) ? '#' : 'n')<CR>
inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O
let g:EasyMotion_smartcase=1
map <tab> :b#<cr>
map <leader> <Plug>(easymotion-prefix)
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f2)
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)
map  <leader>w <Plug>(easymotion-bd-w)
map  <leader>r :Ranger<cr>
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

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
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction
 
command! BD call fzf#run(fzf#wrap({'source': s:list_buffers(),'sink*': { lines -> s:delete_buffers(lines) },'options': '--multi --reverse --bind ctrl-a:select-all+accept'}))

hi notesQuestion ctermfg=163
hi notesImportant ctermfg=9
hi notesPriority ctermfg=166
hi notesAction ctermfg=14
hi notesEvent ctermfg=10
hi notesScheduled ctermfg=11
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE 
