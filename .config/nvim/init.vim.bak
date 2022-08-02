"
" getchoo's neovim config
"

set nocompatible

set runtimepath+=/home/seth/.local/share/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/.local/share/dein')

call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
call dein#add('wsdjeg/dein-ui.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('joshdick/onedark.vim')
call dein#add('arcticicestudio/nord-vim')
call dein#add('rose-pine/neovim', {'name': 'rose-pine'})
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

call dein#end()

" coc settings
"" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"" for lightline.vim
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" options
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" apperance
syntax on
filetype plugin indent on
set termguicolors
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
