
" let g:BibleTranslation = "DutSVV"
" let g:BibleFormat = ""
" let g:BibleLocale = "nl"

let g:BibleDelimiter = ' '

" nnoremap <leader>lpe y :call Bible()<CR>
" vnoremap <leader>lpe y :call Bible(@*)<CR>

nnoremap <leader>kk y :call bible#insert_quote('', 'KJV')<CR>
" nnoremap <leader>kn y :call bible#insert_quote('', 'NKJV')<CR>
nnoremap <leader>ks y :call bible#insert_quote('', 'DutSVV')<CR>

vnoremap <leader>kk y :call bible#insert_quote(@*, 'KJV')<CR>
" vnoremap <leader>kn y :call bible#insert_quote(@*, 'NKJV')<CR>
vnoremap <leader>ks y :call bible#insert_quote(@*, 'DutSVV')<CR>

let g:which_key_map['k'] = {'name': '+Bible',
      \'k': 'KJV',
      \'s': 'SVV'
      \}
