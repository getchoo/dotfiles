"
"  g3tchoo's neovim config
"

" plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'

call plug#end()

" settings
colorscheme dracula
set termguicolors
set nocompatible
set expandtab
set tabstop=4
set shiftwidth=4
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }
syntax on
filetype plugin indent on
