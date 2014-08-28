execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
map <Leader>n <plug>NERDTreeTabsToggle<CR>


if has("gui_running")
  set hlsearch
  colorscheme flatlandia
  set bs=2
  set ai
  set ruler
  set guifont=DejaVu\ Sans\ Mono:h20
endif
