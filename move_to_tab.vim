
" from https://vim.fandom.com/wiki/Move_current_window_between_tabs

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    vert topleft split
  else
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    vert topleft split
  else
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
