" "
" General

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set nocompatible


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

" use <F3> to enable paste mode
"  In this mode autoindentation doesn't spoil indentation of fragment
"  being inserted like it does in insert mode
set pastetoggle=<F3>

" hybrid line numbers
set nu rnu


" "
" Automatically removing trailing whitespace

autocmd FileType c,cpp,java,h,hpp,py,txt,md,sql autocmd BufWritePre <buffer> %s/\s\+$//e


" "
" Keys

" Esc is too far for my lazyness
inoremap jkl <ESC>
inoremap олд <ESC>
" inoremap JKL <ESC> commented out - actually lowercase jkl helps me to notice CapsLock
" before entering normal mode

" Use <S> and <s> to insert single character
" Credits: https://vim.fandom.com/wiki/Insert_a_single_character
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>


" "
" Whole word wrap leningr.. oh, sorry
set wrap
set lbr

" "
" Using <Enter> to insert a blank line without leaving normal mode
nnoremap <Enter> i<Enter><Esc>k$

" "
" Bindings to use Russian layout in normal mode
:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" "
" Vim functions for setting tab width
function! SetTabWidth2()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
endfunction

function! SetTabWidth4()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab
endfunction
