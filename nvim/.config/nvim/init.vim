"
"  g3tchoo's neovim config
"

" plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" settings
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set incsearch
set termguicolors
syntax on
filetype plugin indent on
colorscheme dracula
let g:lightline = {'colorscheme': 'dracula'}
