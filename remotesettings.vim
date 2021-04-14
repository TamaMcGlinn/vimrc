
let $GIT_EDITOR = 'nvr -cc split --remote-wait'

" When editing for git, delete hidden buffers, so that :wq will signal to nvr to stop waiting, so that git can continue
augroup git_nvr_msg
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
augroup END
