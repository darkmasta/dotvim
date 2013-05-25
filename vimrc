set nocompatible                  " be iMproved
filetype off                      " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'



filetype plugin indent on

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg2 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    
"         My configurations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Number
set number

"" Font
set guifont=ProggyCleanTT\ 12

""Colorscheme
colorscheme railscasts

""Indent
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

"" change word
set cpoptions+=$

"" virtual edit
set virtualedit=all

inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i
inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i

" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

function! BC_AddChar(schar)
 if exists("b:robstack")
 let b:robstack = b:robstack . a:schar
 else
 let b:robstack = a:schar
 endif
endfunction

function! BC_GetChar()
 let l:char = b:robstack[strlen(b:robstack)-1]
 let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
 return l:char
endfunction

" disabling ~ and .swp files
set nobackup  
set noswapfile

" Buf Explorer
let g:bufExplorerShowRelativePath=1

" ctag PATH variable
let Tlist_Ctags_Cmd = 'C:\Program Files\Vim\vim73\tools\ctags58.exe'

" Automaticaly change the current directory to working files directory
set autochdir

" no menu and toolbar
set go-=m
set go-=T
set go-=r

" for hidden buffers
set hidden



                             
