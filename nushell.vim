" unused at the moment
lua <<EOF
vim.opt.shell = "nu"
vim.opt.shellcmdflag = '-c'
vim.opt.shellredir = "o+e> %s"
vim.opt.shellpipe = "o+e>| tee { save %s }"
vim.opt.shellslash = true
vim.opt.shellquote = "'"
vim.opt.shellxquote = ""
EOF
