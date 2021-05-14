" Edit configuration
nnoremap <Leader>vV :e ~/vimrc/vimrc.vim<CR>
nnoremap <Leader>vv :e ~/vimrc/**/*
nnoremap <Leader>vs :e ~/private_vimrc/**/*
nnoremap <Leader>vc :CocConfig<CR>
nnoremap <Leader>vC :CocLocalConfig<CR>
nnoremap <Leader>vg :e ~/.gitconfig<CR>
nnoremap <Leader>vi :e ~/.gitignore<CR>
nnoremap <Leader>vb :e ~/.bashrc<CR>
nnoremap <Leader>va :e ~/.bash_aliases<CR>
nnoremap <Leader>vd :e ~/vimrc/bash/doskey.cmd<CR>
nnoremap <Leader>vp :e ~/vimrc/plugins.vim<CR>
nnoremap <Leader>vP :PlugInstall<CR>

let g:which_key_map['v'] = {'name': '+Config',
             \'v': 'vim config',
             \'s': 'secret vim config',
             \'V': 'vimrc.vim',
             \'c': 'CoC config',
             \'C': 'CoC local config',
             \'p': 'vim plugins',
             \'P': 'install plugins',
             \'g': 'git config',
             \'i': 'git ignore',
             \'b': 'bashrc',
             \'a': 'aliases',
             \'d': 'DOSkey',
             \}
