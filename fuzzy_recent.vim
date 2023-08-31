" These need the vim-fuzzy-recent plugin

function! LinkGitSink(filename) abort
  let l:git_root = systemlist('git rev-parse --show-toplevel')[0]
  let l:relative_path = systemlist('realpath --relative-base="' .. l:git_root .. '" ' .. a:filename)[0]
  call setline('.', getline('.') .. l:relative_path)
endfunction

function! LinkFileSink(filename) abort
  let l:current_file_dir = expand('%:p:h')
  let l:relative_path = systemlist('realpath --relative-base="' .. l:current_file_dir .. '" ' .. a:filename)[0]
  call setline('.', getline('.') .. l:relative_path)
endfunction

nnoremap <silent> <space>fj :call fuzzy_recent#Find()<CR>
nnoremap <silent> <leader>fb :call fuzzy_recent#Find({'extensions': ["", "bash", "zsh", "tsh", "bat", "cmd"]})<CR>
nnoremap <silent> <leader>fl :call fuzzy_recent#Find({'sink_function': 'LinkGitSink'})<CR>
nnoremap <silent> <leader>fL :call fuzzy_recent#Find({'sink_function': 'LinkFileSink'})<CR>
nnoremap <silent> <leader>fc :call fuzzy_recent#Find({'extensions': [expand('%:e')]})<CR>
