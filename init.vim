syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
 Plug 'ptzz/lf.vim'
  Plug 'ruanyl/vim-gh-line'
  Plug 'f-person/git-blame.nvim', { 'branch': 'master' }
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'mhinz/vim-signify'
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 	
  Plug 'hrsh7th/nvim-compe'
  Plug 'morhetz/gruvbox'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'Yggdroot/indentLine'
  Plug 'easymotion/vim-easymotion'
  Plug 'prettier/vim-prettier'
  Plug 'jeetsukumaran/vim-indentwise'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-session'
  Plug 'easymotion/vim-easymotion'
  Plug 'mg979/vim-visual-multi'
  Plug 'haya14busa/incsearch.vim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'mattn/vim-lsp-icons'
  Plug 'ervandew/supertab'
  Plug 'drmingdrmer/vim-toggle-quickfix'
  Plug 'kdheepak/lazygit.vim', {'branch':'nvim-v0.4.3'}
  Plug 'pechorin/any-jump.vim'
  Plug 'matze/vim-move'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'VebbNix/lf-vim'
call plug#end()

source ~/dev/dotfiles/keymaps.vim
source ~/dev/dotfiles/let.vim
source ~/dev/dotfiles/set.vim
source ~/dev/dotfiles/cmd.vim
source ~/dev/dotfiles/hi.vim

lua require'lspconfig'.tsserver.setup{}
lua require("lualine").setup()
lua require'settings'
