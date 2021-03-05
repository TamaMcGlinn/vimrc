
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

" Startify; remove the cow that says daft things
let g:startify_custom_header = ''

" Keep undo history across sessions
set undofile
set undodir=~/.vim/undo

set nofoldenable        " disable folding
au WinEnter * set nofen " really disable folding
au WinLeave * set nofen

" See help alternate-config
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
let g:alternateSearchPath = g:alternateSearchPath . ',sfr:../include/*'
" let g:alternateSearchPath = g:alternateSearchPath . ',reg:|src/\([^/]*\)|include/\1||,reg:|include/\([^/]*\)|src/\1||'

" Show search index
set shortmess-=S

let g:quickui_border_style = 2

" Search inside selection with Alt-/
vnoremap <M-/> <Esc>/\%V

let g:mundo_width = 40
let g:mundo_preview_bottom = 1

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

