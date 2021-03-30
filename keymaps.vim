imap <C-v> <C-r><C-o>+
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :'<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'e
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <CSpace> compe#complete()
inoremap zz <esc>:w!<cr>
map <s-h> <Plug>(IndentWisePreviousEqualIndent)
map <s-j> <Plug>(IndentWiseNextEqualIndent)
map ea <cmd>Rg<cr>
map eb <cmd>Telescope buffers<cr>
map ec <esc>:bufdo bd!<cr>
map ed <cmd>lua require('settings').file_browser_cwd()<cr>
map ee <cmd>lua require('settings').find_growers()<cr>
map ef <esc>:GF?<cr>
map eg :call fzf#run({'source': 'git show --name-only --oneline', 'options':'--header-lines=1', 'sink':'e'})<cr>
map eg <cmd>Telescope git_status<cr>
map eh <esc>:History<cr>
map ei :e ~/dev/dotfiles/init.vim<cr>
map ej <cmd>lua require('settings').find_dotfiles()<cr>
map em <esc>mA
map ep <esc>:FZF<cr>
map eq <cmd>Telescope quickfix previewer=false<cr>
map er <cmd>Telescope live_grep previewer=false<cr>
map ew ci)
map ex :bd!<cr>
map ez <esc>:LazyGit<cr>
map f <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
map za <cmd>Telescope find_files previewer=false<cr>
map zb <cmd>Telescope buffers<cr>
map zc <esc>:PlugClean<cr>
map zd <cmd>lua require('settings').file_browser_cwd()<cr>
map zf <cmd>Telescope file_browser previewer=false<cr>
map zg <cmd>Telescope git_status<cr>
map zi <esc>:PlugInstall<cr>
map zr <cmd>Telescope live_grep previewer=false<cr>
map zs <esc>:so %<cr>
map zt <Plug>window:quickfix:loop
map zv <cmd>Telescope grep_string previewer=false<cr>
map zz <esc>:w!<cr>
nmap <silent>cp :let @" = expand("%")<cr>:let @+ = expand("%")<cr>
nmap eq <Plug>window:quickfix:loop
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:b#<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap c "_c
nnoremap d "_d
nnoremap w W
nnoremap b B
nnoremap el <esc>:FloatermNew --height=0.9 --width=0.9 lf<cr>
noremap 5 %
noremap 8 *
noremap <leader><leader>p O<Esc>p
noremap <leader>p o<Esc>p
noremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
noremap P gP
noremap gP P
noremap gp p
noremap p gp
vmap <C-c> "+y
vmap <C-v> c<ESC>"+p
vmap <C-x> "+c
vnoremap c "_c
vnoremap d "_d
