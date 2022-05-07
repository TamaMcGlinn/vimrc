
let g:BibleDelimiter = ' '

nnoremap <leader>kk y :call bible#insert_quote('', 'KJV')<CR>
nnoremap <leader>ks y :call bible#insert_quote('', 'DutSVV')<CR>

vnoremap <leader>kk y :call bible#insert_quote(@*, 'KJV')<CR>
vnoremap <leader>ks y :call bible#insert_quote(@*, 'DutSVV')<CR>

nnoremap <leader>kj :call Bible_search('kjv')<CR>
nnoremap <leader>ki :call Bible_search('kjv', 'Insert_sink')<CR>
nnoremap <leader>kl :call Bible_search('kjv', 'ABwebsite_sink')<CR> 

let g:which_key_map['k'] = {'name': '+Bible',
      \'k': 'KJV verse insert',
      \'j': 'KJV search',
      \'i': 'KJV search & insert',
      \'l': 'KJV search & hugo insert',
      \'s': 'SVV',
      \}

let g:bible_root=substitute(systemlist('which versefinder')[0], '/versefinder', '', '')
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
  return {'line_nr':   l:elements[0],
         \'file_name': l:elements[1],
         \'verse_id':  substitute(join([l:elements[2], l:elements[3]]), ':$', '', ''),
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
