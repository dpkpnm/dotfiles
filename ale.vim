"let b:ale_linters = {'javascript': ['eslint']}
"let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_completion_enabled = 1

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" let g:ale_set_highlights = 0
" let g:airline#extensions#ale#enabled = 1
" function! LinterStatus() abort
    " let l:counts = ale#statusline#Count(bufnr(''))

    " let l:all_errors = l:counts.error + l:counts.style_error
    " let l:all_non_errors = l:counts.total - l:all_errors

    " return l:counts.total == 0 ? 'OK' : printf(
    " \   '%dW %dE',
    " \   all_non_errors,
    " \   all_errors
    " \)
" endfunction

" set statusline=%{LinterStatus()}
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
