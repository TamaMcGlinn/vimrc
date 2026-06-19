
let g:BibleDelimiter = ' '

" English is just k, and then the command,
" k for insert, j for search, i for insert, l for anabaptist.nl reference
" ks => Dutch
" ku => Ukrainian
nnoremap <leader>kk y :call bible#insert_quote('', 'engKJV2006eb')<CR>
nnoremap <leader>kj :call Bible_search('kjv')<CR>
nnoremap <leader>ki :call Bible_search('kjv', 'Insert_sink')<CR>
nnoremap <leader>kl :call Bible_search('kjv', 'ABwebsite_sink')<CR> 

nnoremap <leader>ksk y :call bible#insert_quote('', 'DutSVV')<CR>
nnoremap <leader>ksj :call Bible_search('DutSVV')<CR>
nnoremap <leader>ksi :call Bible_search('DutSVV', 'Insert_sink')<CR>
nnoremap <leader>ksl :call Bible_search('DutSVV', 'ABwebsite_sink')<CR> 

nnoremap <leader>kuk y :call bible#insert_quote('', 'UkrOgienko')<CR>
nnoremap <leader>kuj :call Bible_search('UkrOgienko')<CR>
nnoremap <leader>kui :call Bible_search('UkrOgienko', 'Insert_sink')<CR>
nnoremap <leader>kul :call Bible_search('UkrOgienko', 'ABwebsite_sink')<CR> 

let g:svv_menu = {'name': '+SVV',
      \'k': 'SVV verse insert',
      \'j': 'SVV search',
      \'i': 'SVV search & insert',
      \'l': 'SVV search & hugo insert',
      \}
let g:ukr_menu = {'name': '+UKR',
      \'k': 'UKR verse insert',
      \'j': 'UKR search',
      \'i': 'UKR search & insert',
      \'l': 'UKR search & hugo insert',
      \}
let g:which_key_map['k'] = {'name': '+Bible',
      \'k': 'KJV verse insert',
      \'j': 'KJV search',
      \'i': 'KJV search & insert',
      \'l': 'KJV search & hugo insert',
      \'s': g:svv_menu,
      \'u': g:ukr_menu,
      \}

function! Get_Bible_Root() abort
  let l:versefinder_dirs=systemlist('which versefinder')
  if len(l:versefinder_dirs) == 0
    return ""
  else
    return substitute(l:versefinder_dirs[0], '/versefinder', '', '')
  endif
endfunction

let g:bible_root=Get_Bible_Root()
let g:preview_command='echo {} | cut -d\" \" -f1,2 | xargs -I{} versefinder --previewer {} {q}'

function! Openfile_sink(full_line) abort
  let l:target = Parse_bible_line(a:full_line)
  " echom "File: " .. l:target['file_name']
  " echom "Line: " .. l:target['line_nr']
  silent execute 'edit ' . l:target['file_name']
  silent execute 'normal! ' . l:target['line_nr'] . 'G'
endfunction

" Insert text at the current cursor position.
function! InsertText(text)
    let cur_line_num = line('.')
    let cur_col_num = col('.')
    let orig_line = getline('.')
    let modified_line =
        \ strpart(orig_line, 0, cur_col_num - 1)
        \ . a:text
        \ . strpart(orig_line, cur_col_num - 1)
    " Replace the current line with the modified line.
    call setline(cur_line_num, modified_line)
    " Place cursor on the last character of the inserted text.
    call cursor(cur_line_num, cur_col_num + strlen(a:text))
endfunction

function! Insert_sink(full_line) abort
  let l:line = substitute(a:full_line, '^[^ ]* [^ ]* ', '', '')
  call InsertText(l:line)
endfunction

function! Parse_bible_line(full_line) abort
  let l:elements = split(a:full_line)
  let l:content = substitute(a:full_line, '^[^:]*:[^:]*: ', '', '')
  let l:verse_id = substitute(a:full_line, '^[^ ]* [^ ]* \([^:]*:[^:]*\).*', '\1', '')
  return {'line_nr':   l:elements[0],
         \'file_name': l:elements[1],
         \'verse_id':  l:verse_id,
         \'content':   l:content}
endfunction

function! ABwebsite_sink(full_line) abort
  " inserts e.g. the following, for use in a custom hugo partial in a webpage
  " {{< bible_quote "Thou shalt not bear false witness against thy neighbour." "Exodus 20:16" >}}
  let l:target = Parse_bible_line(a:full_line)
  let l:text = "{{< bible_quote \"" .. l:target['content'] .. "\" \"" .. l:target['verse_id'] .. "\" >}}"
  call InsertText(l:text)
endfunction

function! Bible_search(language='kjv', sink='Openfile_sink') abort
      call fzf#run(fzf#wrap({'source': "awk ' { print \"+\" FNR \" \" FILENAME \" \" $0 } ' " .. g:bible_root .. "/" .. a:language .. "/*.txt", 
      \ 'options': '--with-nth 3.. --no-hscroll --preview-window right,84%,border --preview "' .. g:preview_command .. '"',
      \ 'sink': function(a:sink)}))
endfunction
