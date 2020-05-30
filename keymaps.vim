let mapleader=" "
map <silent><Leader>s <Esc>:w<CR>
map <silent><Leader>g <Esc>:FZF ~/dev/growers-ui<CR>
map <silent><Leader>/ <Esc>:Rg<CR>
map <silent><Leader>f <Esc>:FZF<CR>

map <silent><Leader>c :e ~/.config/nvim/init.vim<CR>
map <silent><Leader>v :w<bar> so %<CR>
map <silent><Leader>b :bn<CR>
map <silent><Leader>x :bd<CR>
map <silent><Leader>o :Explore<CR>
map <C-s> :w<kEnter>
imap <C-s> <Esc>:w<kEnter>i
imap <S-Up> <Esc>:visual<cr><Up> 
nmap <S-Down> <Esc>v<Down>
nmap <S-Left> <Esc>v<Left>
nmap <S-Right> <Esc>v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
vmap <Del> dd
map <silent><c-q> <plug>NERDCommenterToggle
nnoremap <silent><Tab> :bnext<cr>
nnoremap <silent><S-Tab> :bd<cr>
nnoremap <silent><c-Tab> :<c-w>w<cr>
nnoremap <silent><leader>w :w<cr>
map <M-right> <C-w>l
nnoremap U <C-R> # redo

nnoremap <leader><leader> :Startify<cr>
imap jjk :w<cr>
imap jj <ESC>
map L $ 
map H ^

nnoremap p P
nnoremap P p

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
