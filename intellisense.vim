
lua require('custom_lspconfig')

source ~/vimrc/lsp_most_severe_gutter.vim
" source ~/vimrc/autocomplete.vim

source ~/vimrc/ale_settings.vim
source ~/vimrc/syntastic.vim
source ~/vimrc/compiler_explorer.vim

let g:custom_formatters_loaded = get(g:, 'custom_formatters_loaded', v:false)
if !g:custom_formatters_loaded
  let g:custom_formatters_loaded = v:true
  source ~/vimrc/formatters.vim
endif

