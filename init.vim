set noshowmode
set cmdheight=1                       " Height of the command bar
set incsearch                         " Makes search act like search in modern browsers
set showmatch                         " show matching brackets when text indicator is over them
set relativenumber                    " Show line numbers
set number                            " But show the actual number for the line we're on
set ignorecase                        " Ignore case when searching...
set smartcase                         " ... unless there is a capital letter in the query
set hidden                            " I like having buffers stay around
set cursorline                        " Highlight the current line
set completeopt-=preview              " Turn off preview
set noequalalways                     " I don't like my windows changing all the time
set splitright                        " Prefer windows splitting to the right
set splitbelow                        " Prefer windows splitting to the bottom
set updatetime=1000                   " Make updates happen faster

" I wouldn't use this without my DoNoHL function
set hlsearch

set scrolloff=10                      " Make it so there are always ten lines below my cursor

" Tabs
" Want auto indents automatically
set autoindent
set cindent
set wrap

" Set the width of the tab to 4 wide
" This gets overridden by vim-sleuth, so that's nice
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Make it so that long lines wrap smartly
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

" Always use spaces instead of tab characters
set expandtab

" Folding
set foldmethod=marker
set foldlevel=0
set modelines=1

" Just turn the dang bell off
set belloff=all

" Clipboard
" Always have the clipboard be the same as my regular clipboard
set clipboard+=unnamedplus

set inccommand=split
set list

syntax enable

set noswapfile

if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

set shada=!,'1000,<50,s10,h

set mouse=n

" Helpful related items:
"   1. :center, :left, :right
"   2. gw{motion} - Put cursor back after formatting motion.
"
" TODO: w, {v, b, l}

set formatoptions-=a    " Auto formatting is BAD.
set formatoptions-=t    " Don't auto format my code. I got linters for that.
set formatoptions+=c    " In general, I like it when comments respect textwidth
set formatoptions+=q    " Allow formatting comments w/ gq
set formatoptions-=o    " O and o, don't continue comments
set formatoptions+=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " I'm not in gradeschool anymore
set nojoinspaces        " Two spaces and grade school, we're done

" set fillchars=eob:⠀
set fillchars=eob:~
" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'thezeroalpha/vim-lf'
	Plug 'voldikss/vim-floaterm'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'wellle/targets.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3'}
	Plug 'machakann/vim-highlightedyank'
	Plug 'morhetz/gruvbox'
    Plug 'chrisbra/NrrwRgn'
call plug#end()



let g:floaterm_keymap_toggle = '<c-t>'
let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment', 'border':'sharp'} }

" All mapping should be here
let mapleader = " "
nnoremap <silent> <C-e> <esc>:FloatermNew --height=0.8 --width=0.8 lf<cr>
nnoremap <silent> <C-p> :FZF<cr>
nnoremap <silent> <C-h> :History<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-f> :GF?<cr
nnoremap <silent> <C-l> :LazyGit<cr>
nnoremap <silent> <C-s> :w<cr> :so %<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
nnoremap <leader>e :bd!<cr>
nnoremap <leader><leader> <C-^>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <c-`> gvy:call setreg('', TwiddleCase("forward"), getregtype(''))<CR>gv""P
nnoremap <c-~> gvy:call setreg('', TwiddleCase("backward"), getregtype(''))<CR>gv""P
nmap <nowait> q <plug>(Mac_Play)
nmap <nowait> gq <plug>(Mac_RecordNew)
let g:gruvbox_italic=1
colorscheme gruvbox

nnoremap <c-r>w :%s/<c-r><c-w>//g<left><left>
tnoremap <leader><Esc> <C-\><C-n>
    tnoremap <Esc><Esc> <C-\><C-n>

    " Easy moving between the buffers
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l

    " Try and make sure to not mangle space items
    tnoremap <S-Space> <Space>
    tnoremap <C-Space> <Space>
