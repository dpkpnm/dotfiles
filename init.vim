call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }

call plug#end()
