" Based on Plug 'skywind3000/vim-quickui'
" See https://github.com/skywind3000/vim-quickui/blob/master/MANUAL.md
" clear all the menus

let g:quickui_border_style = 2

" call quickui#menu#reset()
" call quickui#menu#install('&Git', [
"             \ [ '&Compile', 'echo 1' ],
"             \ [ '&Run', 'echo 2' ],
"             \ ], '<auto>', 'floggraph')
" " install a 'File' menu, use [text, command] to represent an item.
" call quickui#menu#install('&File', [
"             \ [ "&New File\tCtrl+n", 'echo 0' ],
"             \ [ "&Open File\t(F3)", 'echo 1' ],
"             \ [ "&Close", 'echo 2' ],
"             \ [ "--", '' ],
"             \ [ "&Save\tCtrl+s", 'echo 3'],
"             \ [ "Save &As", 'echo 4' ],
"             \ [ "Save All", 'echo 5' ],
"             \ [ "--", '' ],
"             \ [ "E&xit\tAlt+x", 'echo 6' ],
"             \ ])
"
" " items containing tips, tips will display in the cmdline
" call quickui#menu#install('&Edit', [
"             \ [ '&Copy', 'echo 1', 'help 1' ],
"             \ [ '&Paste', 'echo 2', 'help 2' ],
"             \ [ '&Find', 'echo 3', 'help 3' ],
"             \ ])
"
" " script inside %{...} will be evaluated and expanded in the string
" call quickui#menu#install("&Option", [
" 			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
" 			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
" 			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
" 			\ ])
"
" " register HELP menu with weight 10000
" call quickui#menu#install('H&elp', [
" 			\ ["&Cheatsheet", 'help index', ''],
" 			\ ['T&ips', 'help tips', ''],
" 			\ ['--',''],
" 			\ ["&Tutorial", 'help tutor', ''],
" 			\ ['&Quick Reference', 'help quickref', ''],
" 			\ ['&Summary', 'help summary', ''],
" 			\ ], 10000)
"
" " enable to display tips in the cmdline
" let g:quickui_show_tip = 1
"
" noremap <Leader>m :call quickui#menu#open()<cr>
