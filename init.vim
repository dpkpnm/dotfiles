call plug#begin()
  Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
  Plug 'connorholyday/vim-snazzy'
  Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
  Plug 'pbogut/fzf-mru.vim'
  Plug 'mbbill/vim-seattle'
  Plug 'inkarkat/vim-UnconditionalPaste'
  Plug 'mbbill/undotree'
 Plug 'dense-analysis/ale'
  Plug 'Raimondi/delimitMate'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-sensible'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'vim-scripts/utl.vim'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-session'
  Plug 'justinmk/vim-dirvish'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install --bin'}
  Plug 'junegunn/fzf.vim'
  Plug 'phanviet/vim-monokai-pro'
  "Plug 'unblevable/quick-scope'
  Plug 'easymotion/vim-easymotion'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'tpope/vim-commentary'
  Plug 'pechorin/any-jump.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'wellle/targets.vim'
  Plug 'jreybert/vimagit'
  Plug 'universal-ctags/ctags'
  Plug 'airblade/vim-gitgutter'
  Plug 'dyng/ctrlsf.vim'
call plug#end()
source ~/dev/dotfiles/base.vim
source ~/dev/dotfiles/prettier.vim
source ~/dev/dotfiles/notes.vim
source ~/dev/dotfiles/statusline.vim

