" source ~/vimrc/dein_framework.vim " includes plugins.vim
source ~/vimrc/plug_framework.vim " includes plugins.vim

" general settings
source ~/vimrc/first.vim
source ~/vimrc/python.vim
source ~/vimrc/ada.vim
source ~/vimrc/tabsettings.vim
source ~/vimrc/remotesettings.vim
source ~/vimrc/search_settings.vim
source ~/vimrc/automkdir.vim
source ~/vimrc/settings.vim
source ~/vimrc/intellisense.vim
source ~/vimrc/langserver.vim

" custom definitions
source ~/vimrc/move_to_tab.vim

" mappings
source ~/vimrc/space_menu.vim
source ~/vimrc/navmenu.vim
source ~/vimrc/filemenu.vim
source ~/vimrc/cocmenu.vim
source ~/vimrc/dirmenu.vim
source ~/vimrc/tab_bindings.vim
source ~/vimrc/bible.vim

source ~/vimrc/controls.vim
source ~/vimrc/cheatsheet.vim
source ~/vimrc/visuals.vim
source ~/vimrc/git.vim
source ~/vimrc/switch_maps.vim
source ~/vimrc/cscope_maps.vim
source ~/vimrc/minimap.vim

if filereadable("~/private_vimrc/private.vim")
  source ~/private_vimrc/private.vim
endif
