filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set autoindent
set smartindent

" use indentation for <o>
inoremap <CR> <CR>x<BS>

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" Ctrl + J or Ctrl + K to switch between panes
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
