
function! IsReply()
    if line('$') > 1
        " Strip old signature
        :g/^>\+\s*--\s*$/,$ delete
        " :%!par w72q
        " match non empty lines that are not followed by lines that are empty or
        " just >.  Replace with original line plus a space
        " :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
        " lines that are just > and space remove trailing space
        " :%s/^>*\zs\s\+$//e
        :1
        :put! =\"\n\n\"
        :1
    endif
endfunction

call IsReply()
execute 'startinsert'

setl tw=72
setl wrap linebreak
