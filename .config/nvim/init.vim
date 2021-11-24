"
"  g3tchoo's neovim config
"

" plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'sickill/vim-monokai'

call plug#end()

" options
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set incsearch
set termguicolors

" functions
function! CocCurrentFunction() " for lightline
    return get(b:, 'coc_current_function', '')
endfunction

" keybinds
nnoremap <C-n> :NERDTreeToggle<CR>

" appearance
syntax on
filetype plugin indent on
colorscheme monokai
let g:lightline = {
      \ 'colorscheme': 'monokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
let g:NERDTreeGitStatusWithFlags = 1

" coc config
let g:coc_global_extensions = [
  \ 'coc-jedi',
  \ 'coc-rls',
  \ 'coc-clangd',
  \ ]
