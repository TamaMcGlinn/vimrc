
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

" Code autoformatting
" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer yapf
"   " Alternative: autocmd FileType python AutoFormatBuffer autopep8
"   autocmd FileType rust AutoFormatBuffer rustfmt
"   autocmd FileType vue AutoFormatBuffer prettier
" augroup END

" Show search index
set shortmess-=S

let g:quickui_border_style = 2

" Search inside selection with Alt-/
vnoremap <M-/> <Esc>/\%V
