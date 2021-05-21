" Edit configuration
nnoremap <Leader>vV :e ~/vimrc/vimrc.vim<CR>
nnoremap <Leader>vv :e ~/vimrc/**/*
nnoremap <Leader>vm :e ~/dotfiles/muttrc/muttrc.muttrc<CR>
nnoremap <Leader>vn :e ~/dotfiles/newcomputer<CR>
nnoremap <Leader>vs :e ~/private_vimrc/**/*
nnoremap <Leader>vc :CocConfig<CR>
nnoremap <Leader>vC :CocLocalConfig<CR>
nnoremap <Leader>vg :e ~/.gitconfig<CR>
nnoremap <Leader>vi :e ~/.gitignore<CR>
nnoremap <Leader>vb :e ~/.bashrc<CR>
nnoremap <Leader>va :e ~/.bash_aliases<CR>
nnoremap <Leader>vd :e ~/vimrc/bash/doskey.cmd<CR>

" Plugin menu
nnoremap <Leader>vpp :e ~/vimrc/plugins.vim<CR>
nnoremap <Leader>vpi :PlugInstall<CR>
nnoremap <Leader>vpc :PlugClean<CR>
nnoremap <Leader>vpu :PlugUpdate<CR>

let g:plugins_menu = {'name': '+Plugins',
      \'p': 'View',
      \'i': 'Install',
      \'u': 'Update',
      \'c': 'Clean',
      \}

let g:which_key_map['v'] = {'name': '+Config',
             \'v': 'vim config',
             \'s': 'secret vim config',
             \'m': 'Muttrc',
             \'V': 'vimrc.vim',
             \'c': 'CoC config',
             \'C': 'CoC local config',
             \'p': g:plugins_menu,
             \'g': 'git config',
             \'i': 'git ignore',
             \'n': 'newcomputer',
             \'b': 'bashrc',
             \'a': 'aliases',
             \'d': 'DOSkey',
             \}
