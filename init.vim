set nocompatible hidden autoread nohlsearch noruler noswapfile nofoldenable noerrorbells incsearch ignorecase cursorline noconfirm rnu nu tabstop=2 softtabstop=2 shiftwidth=2 expandtab scrolloff=15 clipboard=unnamedplus t_Co=256 background=dark cmdheight=1 selectmode+=mouse
set foldmethod=indent
syntax on
set completeopt+=noselect
 set shortmess+=c   " Shut off completion messages
  set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
let g:fzf_layout = { 'window': '10split enew' }
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'pechorin/any-jump.vim'
  Plug 'wellle/targets.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'morhetz/gruvbox'
  Plug 'justinmk/vim-dirvish'
    let dirvish_mode = ':sort ,^.*/,'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    let g:prettier#autoformat = 1
    let g:prettier#autoformat_require_pragma = 0
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_OPTS = '--layout=reverse'
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment', 'border':'sharp'} }
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-session'
    let g:session_autosave='yes'
    let g:session_autoload='yes'
  Plug 'easymotion/vim-easymotion'
  Plug 'rhysd/git-messenger.vim'
  Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' } 
  Plug 'ruanyl/vim-gh-line'
  Plug 'machakann/vim-highlightedyank'
Plug 'lifepillar/vim-mucomplete'
call plug#end()

let mapleader = " "
map ea :e ~/dev/notes/092020.txt<cr>
map eg :cd ~/dev/formula/<cr>
map en :cd ~/dev/notifications-api/<cr>
map ei :e ~/dev/dotfiles/init.vim<cr>
map eb :Buffers<cr>
map es :w<cr>:so %<cr>
map eh :History<cr>
map ej :AnyJump<cr>
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
nnoremap <silent> <C-p> :GitFiles<cr>
nnoremap <silent> <C-q> :q<cr>
nnoremap <silent> <C-h> :Maps<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-f> :GF?<cr>
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <leader>g :Rg <c-r><c-w><cr>
nnoremap <silent> <C-g> :Rg <cr>
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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right', 'ctrl-/'), <bang>0)
function! s:format_qf_line(line)
  let parts = split(a:line, ':')
  return { 'filename': parts[0]
         \,'lnum': parts[1]
         \,'col': parts[2]
         \,'text': join(parts[3:], ':')
         \ }
endfunction

function! s:qf_to_fzf(key, line) abort
  let l:filepath = expand('#' . a:line.bufnr . ':p')
  return l:filepath . ':' . a:line.lnum . ':' . a:line.col . ':' . a:line.text
endfunction

function! s:fzf_to_qf(filtered_list) abort
  let list = map(a:filtered_list, 's:format_qf_line(v:val)')
  if len(list) > 0
    call setqflist(list)
    copen
  endif
endfunction

command! FzfQF call fzf#run({
      \ 'source': map(getqflist(), function('<sid>qf_to_fzf')),
      \ 'down':   '20',
      \ 'sink*':   function('<sid>fzf_to_qf'),
      \ 'options': '--reverse --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all --prompt "quickfix> "',
      \ })
function! s:make_sentence(lines)
  return substitute(join(a:lines), ' ', '\=toupper(submatch(0))', '').' '
endfunction

inoremap <expr> <c-k> fzf#vim#complete({
  \ 'source':  'cat ~/dev/tinybind/words.txt',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse ',
  \ })
