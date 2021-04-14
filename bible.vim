
" let g:BibleTranslation = "DutSVV"
" let g:BibleFormat = ""
" let g:BibleLocale = "nl"

let g:BibleDelimiter = ' '

" nnoremap <leader>lpe y :call Bible()<CR>
" vnoremap <leader>lpe y :call Bible(@*)<CR>

nnoremap <leader>kk y :call Bible('', 'KJV')<CR>
nnoremap <leader>kn y :call Bible('', 'DutSVV')<CR>

vnoremap <leader>kk y :call Bible(@*, 'KJV')<CR>
vnoremap <leader>kn y :call Bible(@*, 'DutSVV')<CR>

let g:which_key_map['k'] = {'name': '+Bible',
      \'k': 'KJV',
      \'n': 'SVV'
      \}
