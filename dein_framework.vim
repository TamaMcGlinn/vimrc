" dein Scripts-----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/vimscripts/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/vimscripts/dein', ['~/vimrc/plugins.vim'])

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

source ~/vimrc/plugins.vim

" Required:
call dein#end()

let dein#enable_notification = 1

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
