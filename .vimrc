" "
" Indentation

filetype plugin indent on
set autoindent
set smartindent

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" use indentation for <o>
inoremap <CR> <CR>x<BS>

" "
" Hybrid line numbers:
"  abs for current & rel for other lines

set number relativenumber
set nu rnu

" "
" Keys

" Ctrl+j or Ctrl+k to switch between panes
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" "
" Whole word wrap LENINGR.. oh, sorry
set wrap
set lbr
