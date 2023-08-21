command! -bang FindPlugin call fzf#vim#files('~/.vim/plugged', <bang>0)

function! EditUltiSnips(plugin_dir) abort
  let l:ft = &filetype
  let l:base = a:plugin_dir . '/UltiSnips/'
  execute 'e ' . l:base . l:ft . '.snippets'
endfunction

" Edit vim configuration
nnoremap <Leader>vV :e ~/vimrc/vimrc.vim<CR>
nnoremap <Leader>vv :e ~/vimrc/**/*

nnoremap <Leader>vm :e ~/dotfiles/muttrc/muttrc.muttrc<CR>

" Edit dotfiles
nnoremap <Leader>vn :e ~/dotfiles/install<CR>
nnoremap <Leader>va :e ~/dotfiles/bash_aliases<CR>
nnoremap <Leader>vd :e ~/dotfiles/**/*
nnoremap <Leader>vg :e ~/dotfiles/gitconfig<CR>
nnoremap <Leader>vi :e ~/.gitignore<CR>
nnoremap <Leader>vI :e ~/.ipython/profile_default/startup/00-imports.py<CR>
nnoremap <Leader>vb :e ~/dotfiles/bashrc<CR>
nnoremap <Leader>vB :e ~/.private_bashrc<CR>
nnoremap <Leader>vh :e ~/private_vimrc/ssh_config<CR>
nnoremap <Leader>vs :e ~/private_vimrc/**/*
nnoremap <Leader>vS :e ~/private_vimrc/private.vim<CR>
nnoremap <Leader>ve :e ~/code/zenseact/scripts/**/*

" Edit code config
nnoremap <leader>vu :call EditUltiSnips('~/vimrc')<CR>
nnoremap <leader>vU :call EditUltiSnips('~/private_vimrc')<CR>
nnoremap <Leader>vy :e ~/.config/pycodestyle<CR>
nnoremap <Leader>vc :e ~/.config/clangd/config.yaml<CR>
nnoremap <leader>vl :e ~/.config/alire/indexes/community/repo/index/<CR>:Gcd<CR>

function! ResetPluginsToHttpAndUpdate() abort
  call system("reset_vim_plugins_to_http")
  execute "PlugUpdate"
endfunction

" Plugin menu
nnoremap <Leader>vpp :e ~/vimrc/plugins.vim<CR>
nnoremap <Leader>vpi :PlugInstall<CR>
nnoremap <Leader>vpc :PlugClean<CR>
nnoremap <Leader>vpu :call ResetPluginsToHttpAndUpdate()<CR>
nnoremap <Leader>vpf :FindPlugin<CR>


" Logs
nnoremap <Leader>vq :LspLog<CR>
nnoremap <Leader>vw :e ~/efmlog.txt<CR>

let g:plugins_menu = {'name': '+Plugins',
      \'p': 'View',
      \'i': 'Install',
      \'u': 'Update',
      \'c': 'Clean',
      \}

let g:which_key_map['v'] = {'name': '+Config',
             \'v': 'vim config',
             \'w': 'EFM log',
             \'q': 'lsp log',
             \'r': 'LSP config',
             \'s': 'secret vim config',
             \'m': 'Muttrc',
             \'u': 'UltisnipsEdit',
             \'V': 'vimrc.vim',
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
