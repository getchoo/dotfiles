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
Plug 'chriskempson/base16-vim'

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
set termguicolors
let base16colorspace=256
colorscheme base16-tomorrow-night
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
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
  \ 'coc-java',
  \ ]
