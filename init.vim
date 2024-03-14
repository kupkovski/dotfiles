call plug#begin("~/.config/nvim/plugged")
  " close brackets
  Plug 'KermitPurple/vim-closer'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'princejoogie/dir-telescope.nvim'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	    " Visualize the undotree with telescope
  Plug 'debugloop/telescope-undo.nvim'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'nvim-pack/nvim-spectre'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	
	" Themes
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'yorickpeterse/nvim-grey'
	Plug 'yorickpeterse/vim-paper'
	Plug 'projekt0n/github-nvim-theme'

	" Rails
	Plug 'tpope/vim-rails'
call plug#end()

let mapleader = " "
set nomodeline
set termguicolors
set mouse=a
set nobackup
set tabstop=2
set ttyfast
set showcmd
set number relativenumber

" colorscheme dracula
" colorscheme catppuccin-latte
" colorscheme paper
colorscheme github_light

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>v <cmd>vsplit<cr>
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>
nnoremap <silent> <leader>bb <C-^>
nnoremap <leader>wq :wq<CR>

lua << EOF
  require('nvim_config')
EOF

