" "
" Indentation

filetype plugin indent on
set autoindent
set smartindent

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" use indentation for <o>
inoremap <CR> <CR>x<BS>

" "
" Automatically removing trailing whitespace

autocmd FileType c,cpp,java,h,hpp,py,txt,md,sql autocmd BufWritePre <buffer> %s/\s\+$//e

" also show EOLs as '$'
set list

" "
" Hybrid line numbers:
"  abs for current & rel for other lines

set nu rnu

" "
" Keys

" Ctrl+j or Ctrl+k to switch between panes
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" "
" Whole word wrap leningr.. oh, sorry
set wrap
set lbr
