" dein Scripts-----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/vimscripts/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/vimscripts/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('TamaHobbit/Ada-Bundle')
call dein#add('vim-scripts/taglist.vim')
call dein#add('vim-scripts/mru.vim')
call dein#add('vim-scripts/YankRing.vim')
call dein#add('nacitar/a.vim')
call dein#add('sjl/gundo.vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired')
call dein#add('Shougo/vimproc.vim')
call dein#add('idanarye/vim-vebugger')
call dein#add('rhysd/conflict-marker.vim')

"call dein#add('fntlnz/atags.vim')
"call dein#add('steffanc/cscopemaps.vim')
"call dein#add('tpope/vim-fugitive')
"call dein#add('xolox/vim-misc') " Required for xolox plugins
"call dein#add('xolox/vim-session')
"call dein#add('tpope/vim-abolish')
"call dein#add('godlygeek/tabular')
"call dein#add('neomake/neomake')
"call dein#add('airblade/vim-gitgutter')
"call dein#add('chrisbra/Recover.vim')
"call dein#add('nelstrom/vim-markdown-folding')
"call dein#add('tpope/vim-ragtag')
"call dein#add('jreybert/vimagit')

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

" fix for yankring message on startup 'target STRING not available'
let g:yankring_clipboard_monitor=0

set runtimepath^=~/vimrc

let g:session_autoload = 'no'

" Auto read file from disk if it was changed somewhere outside editor 
set autoread 
" Set default dictionary for spellchecker as English 
set spelllang=en 
" Use visual bell (no beeping)
set visualbell
" Allow mouse to change split size
set mouse=a
" Relative line numbers for all but the current line (absolute)
set number
set relativenumber
" just one character wide
set numberwidth=1
" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>
" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
" Configure colors
colorscheme gummybears
" Make non-current lines a little lighter, 241 instead of 237
" I have edited this into gummybears.vim, since the following 
" line required reload of vimrc to work
"hi LineNr ctermfg=248

" Configure tabs
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

" Set textwidth
set tw=100

" Allow hidden buffers to have changes
set hidden

" Custom commands start with space
let mapleader = " "
set timeoutlen=230

" Set default window height, for C-W =
"set winheight=38
nnoremap <Leader>b 10<C-W>+<CR>
nnoremap <Leader>B 50<C-W>+<CR>

" reload document
nnoremap <Leader>r :e! %<CR>

" After :set spell, also autocomplete from the dictionary; .wbuti is standard
set complete=.,w,b,u,t,i,kspell

" Change directory to current file
fu! DirToCurrent()
  if &buftype ==# 'terminal'
    let line=getline('.')
    if line =~ "^[^> ]*@[^> ]*"
      let bashdir=join(split(line)[2:])
      let dir=substitute(escape(substitute(bashdir[1].':'.bashdir[2:], "/", "\\", ""), ' \'), "\(master\)$", "", "")
    else
      let dir=substitute(line, ">.*", "", "")
    endif
  else
    let dir=expand('%:p:h')
  endif
  :exe "cd ".dir
  :echom "cd ".dir
endfunction
nnoremap <Leader>q :call DirToCurrent()<CR>

" Remove search highlight with yoh (vim-unimpaired)
"nnoremap <silent> <Leader>d :nohl<CR>

" CTags
nnoremap <Leader>t :!ctags -R<CR><CR> 	" Generate tags, note that <Leader>ix is preferable

" Navigate
nnoremap <Leader>oo :MRU<CR>			                " Show files
nnoremap <Leader>oh :GundoToggle<CR>			        " Show file history
nnoremap <Leader>ot :TlistToggle<CR>			        " Show tags
nnoremap <Leader>oa :args src\/* \| tab sall<CR>  " Open src/*

" Git
" ]x jump to next conflict marker in git, [x is previous
fu! OpenUnmerged()
  execute 'args ' . system("git ls-files --unmerged | cut -f2 | sort -u | sed -r 's/ /\\\\ /g' | paste -sd ' ' -")
endfunction
noremap <silent> <F7> :call OpenUnmerged()<CR>

" CScope
if has("cscope")
  set csto=0
  set cst
  " CScope mappings
  noremap <Leader>ff :cs find 3 <C-R>=expand("<cword>")<CR><CR>
  noremap <Leader>fw :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif

" Tabs
nnoremap <Leader>to :tabe<CR>
nnoremap <Leader>tx :tabc<CR>
nnoremap <Leader>h :tabN<CR>
nnoremap <Leader>l :tabn<CR>

" Sessions
if has("win32")
  let sessiondir="C:\\Users\\bc2scf22\\vimsessions\\"
else
  let sessiondir="/home/tama/vimsessions/"
endif
fu! SaveSession( file )
  execute 'mksession! ' . g:sessiondir . a:file . '.vim'
endfunction
fu! RestoreSession( file )
  if filereadable( g:sessiondir . a:file . '.vim' )
    execute 'source ' . g:sessiondir . a:file . '.vim'
  endif
  if has("cscope")
    " add CScope database in current directory
    if filereadable("cscope.out")
      silent cs add cscope.out
    endif
  endif
endfunction

nnoremap <Leader>ss :call SaveSession( 'default' )<CR>
nnoremap <Leader>sl :call RestoreSession( 'default' )<CR>
nnoremap <Leader>sw :call SaveSession( input('Save Session: ') )<CR>
nnoremap <Leader>so :call RestoreSession( input('Load Session: ') )<CR>
set sessionoptions-=options  " Don't save options

" Makefile
nnoremap <Leader>ii :!make<CR>
nnoremap <Leader>it :!make test<CR>
nnoremap <Leader>ic :!make clean<CR>
nnoremap <Leader>ir :!make regenerate_tests<CR>

" Tags
nnoremap <Leader>ix :!adatags.sh<CR>

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

" Terminal settings
" cc for commandline, cs for split first, ce to exit
:tnoremap <ESC> <C-\><C-n>
if has("win32")
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  nnoremap <Leader>cc :term<CR>adoskey.cmd<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cs :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cd :term<CR>adoskey.cmd<CR>cls<CR>
  nnoremap <Leader>csd :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>
else
  nnoremap <Leader>cc :term<CR>A
  nnoremap <Leader>cs :sp<CR>:wincmd j<CR>:term<CR>A
endif

augroup TerminalMappings
  autocmd!
  if has("win32")
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>exit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>exit<CR>
  else
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>
  endif
augroup END

" Edit configuration
nnoremap <Leader>vv :e ~/vimrc/vimrc.vim<CR>
nnoremap <Leader>vg :e ~/.gitconfig<CR>
nnoremap <Leader>vi :e ~/.gitignore<CR>
nnoremap <Leader>vr :e ~/.bashrc<CR>
nnoremap <Leader>vd :e ~/vimrc/bash/doskey.cmd<CR>

" reload vimrc file on write
augroup reload_vimrc " {
	autocmd!
	" Every symbolic link needs to be seperately added here
	autocmd bufwritepost vimrc.vim source $MYVIMRC
	autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END " }

" when looking for a file, include subdirectories recursively
set path+=**

" Display all matching files when we tab complete
set wildmenu

" VeBugger mappings
let g:vebugger_leader='<Leader>g'
nnoremap <Leader>gs :VBGstartGDB 
nnoremap <Leader>gt :VBGtoggleTerminalBuffer<CR> 
nnoremap <silent> <Leader>gq :VBGkill<CR>
nnoremap <Leader>gr :VBGrawWrite run<CR>
nnoremap <Leader>gp :VBGstepOut<CR>
nnoremap <Leader>gn :VBGstepOver<CR>
nnoremap <Leader>gg :VBGtoggleBreakpointThisLine<CR>
nnoremap <Leader>gc :VBGcontinue<CR>
nnoremap <Leader>g* :VBGevalWordUnderCursor<CR>
nnoremap <Leader>ge :VBGeval 
nnoremap <Leader>gw :VBGrawWrite 
nnoremap <Leader>ga :VBGclearBreakpoints<CR>
let g:vebugger_view_source_cmd='edit'

" Open file at position from compiler error on the terminal
" e.g. foobar.adb:27:2: "X" not declared in "Y"
" results in opening foobar.adb in the top buffer (not the terminal), and issuing '27G2|'
" Default vim comes close with 'vt:<C-W>gf' - but:
" 1) including the [colon][linenumber] suffix does not work as intended in NeoVim
" 2) this does not include the column, 
" 3) you cannot reuse the top window.

fu! OpenfileInTopBuffer()
  let selection=expand('<cfile>')
  let elements=split(selection, ':')
  let elementlen=len(elements)
  let filename=elements[0]
  if elementlen > 3
    echoerr "gf input invalid, expected [file]:[line]:[column], got " . selection
    return
  endif
  if elementlen > 1
    let line=elements[1]
    if elementlen > 2
      let column=elements[2]
    endif
  endif
  " switch to top buffer
  silent execute 'wincmd k'
  try
    " find the file 
    if elementlen > 1
      " keepjumps ensures the top of the file is not added to the jumplist
      silent execute 'keepjumps find ' . filename
    else
      silent execute 'find ' . filename
      return
    endif
    if elementlen == 3
      " go to the indicated line and column
      silent execute 'normal! ' . line . 'G' . column . '|'
    else " elementlen == 2
      " go to the indicated line
      silent execute 'normal! ' . line . 'G'
    endif
  endtry
endfunction

augroup Terminal_gf_mapping
  autocmd!
  if has("win32")
    autocmd TermOpen * nnoremap <silent> <buffer> gf :call OpenfileInTopBuffer()<CR>
  else
    "autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>
  endif
augroup END

" Current filename options:
" vimrc.vim
inoremap <Leader>aa <C-R>=expand("%:t")<CR>
" C:\Users\bc2scf22\vimrc\vimrc.vim
inoremap <Leader>af <C-R>=expand("%:p")<CR>
" vimrc/vimrc.vim (if pwd is ~)
inoremap <Leader>arf <C-R>=expand("%")<CR>
" C:\Users\bc2scf22\vimrc
inoremap <Leader>ad <C-R>=expand("%:p:h")<CR>
" vimrc (if pwd is ~)
inoremap <Leader>ard <C-R>=expand("%:h")<CR>
" show full filename
nnoremap <Leader>as :echom expand("%:p")<CR>

