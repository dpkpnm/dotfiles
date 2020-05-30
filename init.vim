call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'dense-analysis/ale'
  Plug 'justinmk/vim-dirvish'
  Plug 'tpope/vim-unimpaired'
  "Plug 'peitalin/vim-jsx-typescript'
  "Plug 'ianks/vim-tsx'
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'tpope/vim-fugitive'
  "Plug 'terryma/vim-multiple-cursors'
  "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'tpope/vim-surround'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'preservim/nerdcommenter'
  Plug 'vimwiki/vimwiki'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install --bin'}
  Plug 'junegunn/fzf.vim'
  "Plug 'machakann/vim-highlightedyank'
  Plug 'pseewald/vim-anyfold'
  Plug 'phanviet/vim-monokai-pro'
  "Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
  Plug 'mbbill/undotree'
call plug#end()
source ~/dev/dotfiles/base.vim
"source ~/dev/dotfiles/coc.vim
source ~/dev/dotfiles/anyfold.vim
source ~/dev/dotfiles/fugitive.vim
"source ~/dev/dotfiles/prettier.vim
source ~/dev/dotfiles/statusline.vim
source ~/dev/dotfiles/jsx.vim
source ~/dev/dotfiles/keymaps.vim
