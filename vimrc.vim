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
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

" reload vimrc file on write
if has("autocmd")
	" when we reload this vimrc file, that would add an additional 'reload self'
	" command to the bufwrite event, so if you kept saving your vimrc you would
	" get an exponentially slower editor - augroup means it only does it once
	augroup reload_vimrc " {
		autocmd!
		" Every symbolic link needs to be seperately added here
		autocmd bufwritepost vimrc.vim source $MYVIMRC
		autocmd bufwritepost $MYVIMRC source $MYVIMRC
	augroup END " }
endif

cd C:\code
