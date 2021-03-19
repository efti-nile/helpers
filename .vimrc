set encoding=utf-8

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

" "
" Using `deus` colorscheme

set t_Co=256
colorscheme deus

" "
" Automatically removing trailing whitespace

autocmd FileType c,cpp,java,h,hpp,py,txt,md,sql autocmd BufWritePre <buffer> %s/\s\+$//e

set nu

" "
" Keys

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

