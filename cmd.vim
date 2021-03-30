autocmd FileType netrw setl bufhidden=delete
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
augroup luahighlight
	autocmd!
	autocmd textyankpost * silent! lua require'vim.highlight'.on_yank()
augroup end

function! HandleFZF(file)
  execute 'e' substitute(split(a:file," ")[0],'\','', 'g')
endfunction
command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)

function! Bookmark()
  let name = input('Enter name: ')
	call writefile([ expand('%:p') . ' ' . name], "/Users/deepakpenmetsa/dev/scripts/annotations.txt","a")
endfunction
command! Bookmark :call Bookmark()

