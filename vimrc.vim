let hostname=hostname()
if hostname != "WBLSATSF22S01"
  " dein Scripts-----------------------------
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/code/dein/repos/github.com/Shougo/dein.vim

  " Required:
  call dein#begin('~/code/dein')

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('vim-scripts/Ada-Bundle')
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('nacitar/a.vim')
  call dein#add('sjl/gundo.vim')
  call dein#add('easymotion/vim-easymotion')

  "call dein#add('machakann/vim-highlightedyank')
  "call dein#add('osyo-manga/vim-marching')
  "call dein#add('vim-scripts/YankRing.vim')
  "call dein#add('fntlnz/atags.vim')
  "call dein#add('steffanc/cscopemaps.vim')
  "call dein#add('tpope/vim-fugitive')
  "call dein#add('xolox/vim-misc') " Required for xolox plugins
  "call dein#add('xolox/vim-session')
  "call dein#add('tpope/vim-unimpaired')
  "call dein#add('tpope/vim-abolish')
  "call dein#add('godlygeek/tabular')
  "call dein#add('neomake/neomake')
  "call dein#add('airblade/vim-gitgutter')
  "call dein#add('chrisbra/Recover.vim')
  "call dein#add('nelstrom/vim-markdown-folding')
  "call dein#add('rhysd/conflict-marker.vim')
  "call dein#add('vim-scripts/mru.vim')
  "call dein#add('tpope/vim-ragtag')
  "call dein#add('tpope/vim-surround')
  "call dein#add('tpope/vim-repeat')
  "call dein#add('tpope/vim-speeddating')
  "call dein#add('bronson/vim-trailing-whitespace')
  "call dein#add('jreybert/vimagit')
  "call dein#add('justmao945/vim-clang')

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
endif " End of hostname check, what follows must work without internet

set runtimepath^=~/vimrc

" Use visual bell (no beeping)
set visualbell

" Allow mouse to change split size
set mouse=a

" Relative line numbers for all but the current line (absolute)
set number
set relativenumber

" just one character wide
set numberwidth=1

" grey for all lines but current, which is white
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=white

" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Configure colors
colorscheme gummybears

" Configure tabs
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

" Set textwidth
set tw=100

" Set default window height, for C-W =
"set winheight=38
nmap <Leader>b 10<C-W>+<CR>

" Allow hidden buffers to have changes
set hidden

" Custom commands start with space
let mapleader = " "
set timeoutlen=230

" Change directory to current file
nmap <Leader>q :cd %:p:h<CR>

" Remove search highlight
nmap <Leader>d :nohl<CR>

" CTags
nmap <Leader>t :!ctags -R<CR><CR> 	" Generate tags, note that <Leader>ix is preferable
nmap <Leader>g :TlistToggle<CR>			" Show tags

" CScope
if has("cscope")
  set csto=0
  set cst
  " CScope mappings
  map <Leader>ff :cs find 3 <C-R>=expand("<cword>")<CR><CR>
  map <Leader>fw :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif

" Tabs
nmap <Leader>o :tabe<CR>
nmap <Leader>x :tabc<CR>
nmap <Leader>h :tabN<CR>
nmap <Leader>l :tabn<CR>
nmap <Leader>a :args src\/* \| tab sall<CR>

" Sessions
if has("win32")
  let sessionfile="D:/Software/vimsessions/default.vim"
else
  let sessionfile="~/vimsession.vim"
endif
fu! SaveSess()
  execute 'mksession! ' . g:sessionfile
endfunction
fu! RestoreSess()
  if filereadable(g:sessionfile)
    execute 'source ' . g:sessionfile
  endif
  if has("cscope")
    " add CScope database in current directory
    if filereadable("cscope.out")
      silent cs add cscope.out
    endif
  endif
endfunction
"augroup session_save_restore " {
  "autocmd!
  "autocmd VimLeave * call SaveSess()
  "autocmd VimEnter * nested call RestoreSess()
"augroup END " }
nmap <Leader>ss :call SaveSess()<CR>
nmap <Leader>sl :call RestoreSess()<CR>
set sessionoptions-=options  " Don't save options

" Compiling
nmap <Leader>ii :!make<CR>
nmap <Leader>it :!make test<CR>
nmap <Leader>ic :!make clean<CR>
nmap <Leader>ix :!make tags<CR>
nmap <Leader>ir :!make regenerate_tests<CR>

" Terminal settings
:tnoremap <ESC> <C-\><C-n>
if has("win32")
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  set shellcmdflag=/c\ \"C:\\Progra~2\\Git\\bin\\bash.exe\ --login\ -c\"
  " Leader c for commandline, Leader e to exit
  nmap <Leader>cc :term<CR>acmd.exe /c "C:\\Progra~2\Git\bin\bash.exe --login -i"<CR>
  :tnoremap <Leader>ce exit<CR>exit<CR>
else
  nmap <Leader>cc :term<CR>A
  :tnoremap <Leader>ce exit<CR>
endif

" Edit configuration
nmap <Leader>v :e ~/vimrc/vimrc.vim<CR>

" reload vimrc file on write
augroup reload_vimrc " {
	autocmd!
	" Every symbolic link needs to be seperately added here
	autocmd bufwritepost vimrc.vim source $MYVIMRC
	autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END " }

