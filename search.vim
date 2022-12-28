" With Ag
" nmap <Leader>/ <Plug>AgRawSearch
" vmap <Leader>/ <Plug>AgRawVisualSelection<CR>
" nmap <Leader>* <Plug>AgRawWordUnderCursor<CR>

" With CtrlSF
vmap <Leader>8 <Plug>CtrlSFVwordPath
nmap <Leader>8 <Plug>CtrlSFCCwordExec
nmap <Leader>* <Plug>CtrlSFCwordExec
let g:ctrlsf_confirm_save = 0

let g:which_key_map['*'] = 'Search word'
let g:which_key_map['8'] = 'Search word'

let g:which_key_map['/'] = {'name': '+Search',
   \'/': 'CtrlSF',
   \'a': 'Ada',
   \'g': 'Gpr',
   \'p': 'Python',
   \'b': 'Bazel',
\}

nmap <Leader>// <Plug>CtrlSFPrompt
nmap <Leader>/a :Agada<CR>
nmap <Leader>/g :Aggpr<CR>
nmap <Leader>/p :Agpy<CR>
nmap <Leader>/b :Agbazel<CR>
nmap <Leader>/j :Agjson<CR>
