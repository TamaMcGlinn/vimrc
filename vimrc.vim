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
source ~/vimrc/vimwiki_config.vim
" source ~/vimrc/marks.vim

lua require("noice_config")
lua require("image_config")

source ~/vimrc/intellisense.vim

source ~/vimrc/telescope.vim

source ~/vimrc/better_readonly.vim

" mappings
source ~/vimrc/navmenu.vim
source ~/vimrc/map_translate.vim
source ~/vimrc/filemenu.vim
source ~/vimrc/date.vim

source ~/vimrc/trouble.vim

source ~/vimrc/fuzzy_recent.vim

source ~/vimrc/lspmenu.vim
source ~/vimrc/hover_settings.vim
source ~/vimrc/dirmenu.vim
source ~/vimrc/diagnostic_info.vim
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

call SourceIfReadable("~/private_vimrc/private.vim")

source ~/vimrc/refactoring.vim
source ~/vimrc/copilot_settings.vim

source ~/vimrc/temp.vim
