
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

" Disable spelling checking
set nospell

" when looking for a file, include subdirectories recursively
set path+=**

" Display all matching files when we tab complete
set wildmenu

let g:deoplete#enable_at_startup = 1

" Make program for gprbuild - there is a problem if the sources are in a directory,
" gprbuild should output something to indicate where the file is found
" set makeprg=gprbuild\ -d\ -p\ -g
let makeprg = 'if [ -f Makefile ]; then make; else make -C ..; fi'
set errorformat=%f:%l:%c:\ %m

" Airline settings
" let g:airline#extensions#tabline#enabled = 1
" Show the name of each buffer at the top
" let g:airline#extensions#tabline#fnamemod = ':t'

" Startify; remove the cow that says daft things
let g:startify_custom_header = ''

set nofoldenable        " disable folding
au WinEnter * set nofen " really disable folding
au WinLeave * set nofen

" Keep undo history across sessions
set undofile
set undodir=~/.vim/undo

let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../../src,sfr:../../include,sfr:../include,sfr:../inc,sfr:../tests'
