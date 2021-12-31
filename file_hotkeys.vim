
function! EditUltiSnips(plugin_dir) abort
  let l:ft = &filetype
  let l:base = a:plugin_dir . '/UltiSnips/'
  execute 'e ' . l:base . l:ft . '.snippets'
endfunction

" Edit configuration
nnoremap <Leader>vV :e ~/vimrc/vimrc.vim<CR>
nnoremap <Leader>vv :e ~/vimrc/**/*
nnoremap <Leader>vr :e ~/vimrc/nvim_lspconfig.vim<CR>
nnoremap <Leader>vm :e ~/dotfiles/muttrc/muttrc.muttrc<CR>
nnoremap <Leader>vn :e ~/dotfiles/install<CR>
nnoremap <Leader>vs :e ~/private_vimrc/**/*
nnoremap <Leader>vc :CocConfig<CR>
nnoremap <Leader>vC :CocLocalConfig<CR>
nnoremap <Leader>vg :e ~/dotfiles/gitconfig<CR>
nnoremap <Leader>vi :e ~/.gitignore<CR>
nnoremap <Leader>vl :e ~/.config/pycodestyle<CR>
nnoremap <Leader>vb :e ~/dotfiles/bashrc<CR>
nnoremap <Leader>vB :e ~/.private_bashrc<CR>
nnoremap <Leader>vh :e ~/private_vimrc/ssh_config<CR>
nnoremap <Leader>va :e ~/dotfiles/bash_aliases<CR>
nnoremap <Leader>vd :e ~/dotfiles/**/*
nnoremap <leader>vu :call EditUltiSnips('~/vimrc')<CR>
nnoremap <leader>vU :call EditUltiSnips('~/private_vimrc')<CR>

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
             \'r': 'LSP config',
             \'s': 'secret vim config',
             \'m': 'Muttrc',
             \'u': 'UltisnipsEdit',
             \'V': 'vimrc.vim',
             \'c': 'CoC config',
             \'C': 'CoC local config',
             \'p': g:plugins_menu,
             \'g': 'git config',
             \'i': 'git ignore',
             \'l': 'pycodestyle',
             \'h': 'SSH hosts',
             \'n': 'new computer',
             \'b': 'bashrc',
             \'a': 'aliases',
             \'d': 'dotfiles',
             \}
