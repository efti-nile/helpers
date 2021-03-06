" "
" Set file type based indentation
"  folder `indent` contains an indentation
"  script for different file types

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" use indentation for <o>
inoremap <CR> <CR>x<BS>

" "
" Using 256 color mode

set t_Co=256

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

" "
" Set GVIM font (nice for 2K)

set guifont=Consolas:h12

" "
" If it's Windows, add some folders
"  to `runtimepath`

if has('win32') || has('win64')
  " omnipotence folder
  set runtimepath=$HOME\.vim
endif
