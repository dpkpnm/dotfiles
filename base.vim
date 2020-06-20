set nocompatible
syntax on
filetype plugin indent on
set modelines=0
set number
set relativenumber
set ruler
set wrap
"set textwidth=79
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>
set cmdheight=1
set nomore
set shortmess=T
set noswapfile
"set linebreak
set noerrorbells visualbell t_vb=
set breakindent
set incsearch
set splitbelow
set splitright
set linespace=1
set mouse=r
set clipboard=unnamedplus
set autoread
" set foldcolumn=0
"set list
"set showbreak=↪\ 
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
" set listchars=tab:.\ ,extends:›,precedes:‹,nbsp:·,trail:·
set suffixesadd+=.ts

set hidden
set ttyfast
set laststatus=2

set showmode
set showcmd

set t_Co=256
set background=dark
set backup
set backupdir=~/dev/backup//
set writebackup
au BufWritePre * let &bex ='-'.strftime("%w%d%H%M")
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let dirvish_mode = ':sort ,^.*/,'
colorscheme monokai_pro
augroup suffixes
    autocmd!
    let associations = [
                \["javascript", ".js,.javascript,.es,.esx,.json"],
                \["typescript", ".ts,.tsx"]
                \]
    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
augroup END
let g:deoplete#enable_at_startup = 1
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_custom_header = ['Vim']
function! WindowNumber()
  return tabpagewinnr(tabpagenr())
endfunction
augroup statline_trail
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
augroup END
let g:fzf_action = {
    \ 'ctrl-q': 'wall | bdelete',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
let mapleader=" "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
nnoremap <silent><S-Tab> :bp<cr>
imap <S-Up> <Esc>:visual<cr><Up>
map tt :bn<cr>
map tp :bp<cr>
map tx :bd!<cr>   
map tv :vsp<cr>:bp<cr>
map to :only<cr>
map <M-s> <Esc>:w<kEnter>i
map <M-c> :y<kEnter>
map <C-q> <Esc>:bd!<cr>
map <M-n> <Esc>:bp<cr>
map <M-p> <Esc>:FZF ~/dev/growers-ui<CR>
map <M-f> <Esc>:Rg<CR>
map <silent><Leader>g :G<CR>:only<CR>
map <silent><Leader>s :slient w<CR>
map <silent><Leader>v :w<bar> so %<CR>
map <silent><Leader>c :e ~/dev/dotfiles<CR>
map <silent><Leader>d <Esc>:FZF ~/dev/dotfiles<CR>
map <silent><Leader>n <Esc>:FZF ~/dev/notes<CR>
map <silent><Leader>o <Esc>:Utl<CR>
map <silent><Leader>j <Esc>:Note 062020<CR>
map <silent><leader>b <Esc>:Buffers<CR>
map <silent><leader><leader> :bp<cr>
map <M-b> <Esc>:Buffers<CR>
map <M-right> <C-w>l
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
autocmd BufNewFile,BufRead *.js,.ts,.tsx,*.jsx set filetype=typescript.tsx
hi tsxTagName guifg=#E06C75
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi tsxTypes guifg=#666666
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
hi Folded ctermfg=Gray ctermbg=NONE cterm=italic
hi FoldColumn ctermbg=NONE
hi DiffAdd      ctermfg=Green          ctermbg=NONE
hi DiffChange   ctermfg=Red         ctermbg=NONE
hi DiffDelete   ctermfg=LightBlue     ctermbg=NONE
hi DiffText     ctermfg=Yellow        ctermbg=NONE
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
hi ALEError ctermbg=NONE ctermfg=196
hi ALEErrorSign ctermbg=NONE ctermfg=196
let g:ale_sign_error = '●'
let g:ale_sign_warning = '⚠'
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> <C-k> :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> <C-j> :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>
