
source ~/vimrc/tabsettings.vim
source ~/vimrc/remotesettings.vim

" Auto read file from disk if it was changed somewhere outside editor 
set autoread

" Set default dictionary for spellchecker as English 
set spelllang=en 

" Allow hidden buffers to have changes
set hidden

" After :set spell, also autocomplete from the dictionary; .wbuti is standard
set complete=.,w,b,u,t,i,kspell

" when looking for a file, include subdirectories recursively
set path+=**

" Display all matching files when we tab complete
set wildmenu

let g:deoplete#enable_at_startup = 1

" Make program for gprbuild - there is a problem if the sources are in a directory,
" gprbuild should output something to indicate where the file is found
set makeprg=gprbuild\ -d\ -p\ -g
set errorformat=%f:%l:%c:\ %m

" Airline settings
let g:airline#extensions#tabline#enabled = 1
" Show the name of each buffer at the top
let g:airline#extensions#tabline#fnamemod = ':t'


