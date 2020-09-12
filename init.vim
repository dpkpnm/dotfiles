set nocompatible hidden autoread nohlsearch noruler noswapfile nofoldenable noerrorbells incsearch ignorecase cursorline noconfirm rnu nu tabstop=2 softtabstop=2 shiftwidth=2 expandtab scrolloff=15 clipboard=unnamedplus t_Co=256 background=dark cmdheight=1 selectmode+=mouse
set foldmethod=indent
syntax on
call plug#begin('~/.vim/plugged')
  Plug 'voldikss/vim-floaterm'
  let g:floaterm_keymap_toggle = '<c-t>'
  Plug 'leafOfTree/vim-svelte-plugin'  
  Plug 'diepm/vim-rest-console'
  Plug 'sainnhe/sonokai'
  Plug 'wellle/targets.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'bilalq/lite-dfm'
	Plug 'xolox/vim-misc'
	Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-commentary'
  Plug 'justinmk/vim-dirvish'
    let dirvish_mode = ':sort ,^.*/,'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    let g:prettier#autoformat = 1
    let g:prettier#autoformat_require_pragma = 0
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_OPTS = '--layout=reverse'
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment', 'border':'sharp'} }
  Plug 'antoinemadec/coc-fzf'
	Plug 'pangloss/vim-javascript'    " JavaScript support
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'jparise/vim-graphql'        " GraphQL syntaxPlug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-session'
    let g:session_autosave='yes'
    let g:session_autoload='yes'
  Plug 'easymotion/vim-easymotion'
  Plug 'rhysd/git-messenger.vim'
  Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' } 
  Plug 'ruanyl/vim-gh-line'
  Plug 'machakann/vim-highlightedyank'
  Plug 'tpope/vim-eunuch'
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
nnoremap 8 *

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

nnoremap <silent> <C-a> <plug>(fzf-complete-line)
nnoremap <silent> <C-c> <esc>yy
nnoremap <silent> <C-e> <esc>:FloatermNew --height=0.8 --width=0.8 lf<cr>
nnoremap <silent> <C-v> <esc>p
nnoremap <silent> <C-s> <esc>:w<cr> 
nnoremap <silent> <C-p> :FZF<cr>
nnoremap <silent> <C-q> :q<cr>
nnoremap <silent> <C-h> :Maps<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-f> :GF?<cr>
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <C-g> :Rg <c-r><c-w><cr>
nnoremap <silent> <leader>g :Rg <cr>
imap <leader><leader> <esc>:update <cr>
nnoremap <silent> <C-x> :BD<cr>
map / <Plug>(easymotion-sn)
map <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent>gm <Plug>(git-messenger)
nnoremap <silent> <C-n> :<C-u>exe v:count ? v:count . 'b' : 'b' . (bufloaded(0) ? '#' : 'n')<CR>
inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O
let g:EasyMotion_smartcase=1
map f <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
map <leader>z :LiteDFMToggle<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<C-g>u\<CR>""
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :'<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
nmap <leader>o <Plug>(fzf-complete-path)	
"inoremap <expr> <C-t> fzf#vim#complete({'source': map(complete_info().items, "v:val.word")})
imap <C-f> <plug>(fzf-complete-line)
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

let g:gruvbox_italic=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
colorscheme gruvbox 
hi notesQuestion ctermfg=163
hi notesImportant ctermfg=9
hi notesPriority ctermfg=166
hi notesAction ctermfg=14
hi notesEvent ctermfg=10
hi notesScheduled ctermfg=11
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap c "_c
vnoremap c "_c

function! PInsert2(item)
	let @z=a:item
  norm "zp
	call feedkeys('a')
endfunction

function! CompleteInf()
	let nl=[]
	let l=complete_info()
	for k in l['items']
		call add(nl, k['word']. ' : ' .k['info'] . ' '. k['menu'] )
	endfor 
	call fzf#vim#complete(fzf#wrap({ 'source': nl,'reducer': { lines -> split(lines[0], '\zs :')[0] },'sink':function('PInsert2')}))
endfunction 

imap <c-a> <CMD>:call CompleteInf()<CR>

