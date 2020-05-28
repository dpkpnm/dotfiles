call plug#begin()
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'justinmk/vim-dirvish'
  Plug 'morhetz/gruvbox'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'tpope/vim-fugitive'
call plug#end()
source ~/dev/dotfiles/base.vim
source ~/dev/dotfiles/coc.vim
source ~/dev/dotfiles/gruvbox.vim
source ~/dev/dotfiles/fugitive.vim
source ~/dev/dotfiles/keymaps.vim
