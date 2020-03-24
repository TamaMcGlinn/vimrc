call dein#add('wsdjeg/dein-ui.vim')
call dein#add('TamaHobbit/Ada-Bundle')
"call dein#add('vim-scripts/taglist.vim')
call dein#add('vim-scripts/mru.vim')
call dein#add('vim-scripts/YankRing.vim')
call dein#add('nacitar/a.vim')
call dein#add('sjl/gundo.vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-surround')
call dein#add('Shougo/vimproc.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('idanarye/vim-vebugger')
" call dein#add('rhysd/conflict-marker.vim')
call dein#add('dbakker/vim-paragraph-motion')
call dein#add('junegunn/fzf', {
    \ 'dir': '~/.fzf', 
    \ 'build': './install --all' 
    \ })
call dein#add('junegunn/fzf.vim')
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })

call dein#add('tomtom/tcomment_vim')
"call dein#add('tpope/vim-commentary') " don't use; same as tcomment_vim but can't uncomment paragraph of Ada code
"call dein#add('scrooloose/nerdcommenter') " don't use - no motions

" To learn:
"call dein#add('fntlnz/atags.vim')
"call dein#add('steffanc/cscopemaps.vim')
call dein#add('tpope/vim-fugitive')
"call dein#add('xolox/vim-misc') " Required for xolox plugins
"call dein#add('xolox/vim-session')
"call dein#add('tpope/vim-abolish')
"call dein#add('godlygeek/tabular')
"call dein#add('neomake/neomake')
"call dein#add('airblade/vim-gitgutter')
"call dein#add('chrisbra/Recover.vim')
"call dein#add('nelstrom/vim-markdown-folding')
"call dein#add('tpope/vim-ragtag')
"call dein#add('jreybert/vimagit')

call dein#add('roggan87/vim-bible')

