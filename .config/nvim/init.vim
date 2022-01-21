"
" getchoo's neovim config
"

" plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'ayu-theme/ayu-vim'

call plug#end()

" options
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" apperance
syntax on
filetype plugin indent on
set termguicolors
let ayucolor="mirage"
colorscheme ayu
let g:lightline = {
      \ 'colorscheme': 'ayu_mirage'}
