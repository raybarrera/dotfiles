lua require('config')
set cursorline
set hidden
set mouse=v
set number
set title
set nocompatible
set showmatch
set ignorecase
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
filetype plugin indent on
syntax on
set mouse=a
set ttyfast

" Plugins install via plug
call plug#begin()

Plug 'sainnhe/sonokai'
Plug 'preservim/nerdtree'

call plug#end()

if has('termguicolors')
	set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1

colorscheme sonokai
