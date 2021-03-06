set nocompatible                  " be iMproved
filetype off                      " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-rails.git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafoftree/vim-vue-plugin'
Plugin 'dense-analysis/ale'

Plugin 'msanders/snipmate.vim'

call vundle#end()
filetype plugin indent on

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

ActivateAddons vim-snippets snipmate


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

set noundofile
"" Font
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10

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

inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i

" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

" abbravations
:iabbrev func function foo() {<CR><CR>}<Up><Tab>
:iabbrev cl console.log()<Left><ESC><X><CR>i


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

" syntax highlight on html
au BufReadPost *.ezt set syntax=html

" *** Keys *** 
let mapleader = ","
imap jj <esc>

" *** Abbreviations *** {{{1

iab tihs this
iab tehn then

filetype plugin on

" linting settings
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
