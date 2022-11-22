scriptencoding utf-8

source ~/vimrc/git_diffhistory.vim
source ~/vimrc/git_cycle_diffs.vim
source ~/vimrc/gitremotes.vim
source ~/vimrc/diffview.vim

" Flog teamjump bindings https://github.com/TamaMcGlinn/flog-teamjump.vim
augroup flogteamjump
  autocmd FileType floggraph nno <silent> <buffer> ]] :<C-U>call flogteamjump#Choose_From_Teams()<CR>
  autocmd FileType floggraph nno <silent> <buffer> ]p :<C-U>call flogteamjump#Jump_To_Selected_Team(v:true)<CR>
  autocmd FileType floggraph nno <silent> <buffer> [p :<C-U>call flogteamjump#Jump_To_Selected_Team(v:false)<CR>
augroup END
