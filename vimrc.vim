" source ~/vimrc/dein_framework.vim " includes plugins.vim
source ~/vimrc/plug_framework.vim " includes plugins.vim

source ~/vimrc/util.vim " generally useful functions for scripting

" general settings
source ~/vimrc/first.vim
source ~/vimrc/python.vim
source ~/vimrc/ada.vim
source ~/vimrc/tabsettings.vim
source ~/vimrc/remotesettings.vim
source ~/vimrc/search_settings.vim
source ~/vimrc/automkdir.vim
source ~/vimrc/settings.vim
source ~/vimrc/airline_settings.vim
" source ~/vimrc/marks.vim

source ~/vimrc/intellisense.vim

source ~/vimrc/telescope.vim

source ~/vimrc/better_readonly.vim

" mappings
source ~/vimrc/navmenu.vim
source ~/vimrc/map_translate.vim
source ~/vimrc/filemenu.vim
source ~/vimrc/date.vim
" source ~/vimrc/cocmenu.vim
source ~/vimrc/lspmenu.vim
source ~/vimrc/dirmenu.vim
source ~/vimrc/bible.vim

source ~/vimrc/controls.vim
source ~/vimrc/cheatsheet.vim
source ~/vimrc/visuals.vim
source ~/vimrc/git.vim
source ~/vimrc/switch_maps.vim
source ~/vimrc/cscope_maps.vim
source ~/vimrc/minimap.vim
source ~/vimrc/startup.vim
source ~/vimrc/toggleterm.vim

source ~/vimrc/abbreviations.vim

if filereadable(expand("~/private_vimrc/private.vim"))
  source ~/private_vimrc/private.vim
endif

source ~/vimrc/refactoring.vim

source ~/vimrc/temp.vim
