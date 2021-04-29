" Edit configuration
nnoremap <Leader>vV :e ~/vimrc/vimrc.vim<CR>
nnoremap <Leader>vv :e ~/vimrc/**/*
nnoremap <Leader>vg :e ~/.gitconfig<CR>
nnoremap <Leader>vi :e ~/.gitignore<CR>
nnoremap <Leader>vb :e ~/.bashrc<CR>
nnoremap <Leader>va :e ~/.bash_aliases<CR>
nnoremap <Leader>vd :e ~/vimrc/bash/doskey.cmd<CR>
nnoremap <Leader>vp :e ~/vimrc/plugins.vim<CR>

let g:which_key_map['v'] = {'name': '+Config',
             \'v': 'vim config',
             \'V': 'vimrc.vim',
             \'p': 'vim plugins',
             \'g': 'git config',
             \'i': 'git ignore',
             \'b': 'bashrc',
             \'a': 'aliases',
             \'d': 'DOSkey',
             \}
