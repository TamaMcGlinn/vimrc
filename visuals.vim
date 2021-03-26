" install gruvbox colors
autocmd vimenter * ++nested colorscheme gruvbox

" Use visual bell (no beeping)
set visualbell

" Allow mouse to change split size
set mouse=a

" Relative line numbers for all but the current line (absolute)
set number
set relativenumber

" just one character wide
set numberwidth=1

" NetRW settings
if has("win32")
  " Fix NetRW D key on windows
  let g:netrw_localrmdir='rm -rf'
endif
" Display line numbers in NetRW just as in other files
let g:netrw_bufsettings = 'nomodifiable nomodified readonly nobuflisted nowrap number'
" Banner toggle:
let g:netrw_banner = 0
" Ignore case when sorting
let g:netrw_sort_options = 'i'
" directories first when sorting
let g:netrw_sort_sequence='[\/]$'
" tree style listing
let g:netrw_liststyle = 4
" vsplit netrw to the left window 
let g:netrw_altv = 1
" 30% of the screen for the netrw window, 70% for the file window
let g:netrw_winsize = 30
" open file in a previous buffer (right window)
let g:netrw_browse_split = 0

" don't highlight spelling mistakes
hi clear SpellBad

" let g:airline
