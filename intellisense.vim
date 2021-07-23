" source ~/vimrc/coc_settings.vim
source ~/vimrc/ycm_settings.vim
source ~/vimrc/ale_settings.vim
source ~/vimrc/langserver.vim
source ~/vimrc/syntastic.vim
source ~/vimrc/compiler_explorer.vim

let g:custom_formatters_loaded = get(g:, 'custom_formatters_loaded', v:false)
if !g:custom_formatters_loaded
  let g:custom_formatters_loaded = v:true
  source ~/vimrc/formatters.vim
endif

