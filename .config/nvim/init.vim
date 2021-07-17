"
"  g3tchoo's neovim config
"

" plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'

call plug#end()

" settings
colorscheme nord
set termguicolors
set nocompatible
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
syntax on
filetype plugin indent on
