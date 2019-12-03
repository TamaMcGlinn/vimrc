source ~\vimrc\tabsettings.vim

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
