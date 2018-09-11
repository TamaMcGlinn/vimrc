" Use visual bell (no beeping)
set visualbell

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

" Allow hidden buffers to have changes
set hidden

" Custom commands start with space
let mapleader = " "
set timeoutlen=180

" Remove search highlight
nmap <Leader>d :nohl<CR>

" CTags
nmap <Leader>t :!ctags -R<CR><CR> 	" Generate tags
nmap <Leader>g :TlistOpen<CR>				" Show tags

" Tabs
nmap <Leader>o :tabe<CR>
nmap <Leader>x :tabc<CR>
nmap <Leader>h :tabN<CR>
nmap <Leader>l :tabn<CR>

" Sessions
fu! SaveSess()
  execute 'mksession! D:/Software/vimsessions/default.vim'
endfunction
fu! RestoreSess()
  if filereadable('D:/Software/vimsessions/default.vim')
    execute 'source D:/Software/vimsessions/default.vim'
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction
augroup session_save_restore " {
  autocmd!
  autocmd VimLeave * call SaveSess()
  autocmd VimEnter * nested call RestoreSess()
augroup END " }
set sessionoptions-=options  " Don't save options

" Compiling
nmap <F4> :!make<CR>

" Terminal settings
:tnoremap <ESC> <C-\><C-n>
if has("win32")
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  set shellcmdflag=/c\ \"C:\\Progra~2\\Git\\bin\\bash.exe\ --login\ -c\"
  " Leader c for commandline, Leader e to exit
  nmap <Leader>c :term<CR>acmd.exe /c "C:\\Progra~2\Git\bin\bash.exe --login -i"<CR>
  :tnoremap <Leader>e exit<CR>exit<CR>
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

