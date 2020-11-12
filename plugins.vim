call dein#add('Freed-Wu/dein-ui.vim')

call dein#add('TamaHobbit/Ada-Bundle')
"call dein#add('vim-scripts/taglist.vim')
call dein#add('vim-scripts/mru.vim')
call dein#add('vim-scripts/YankRing.vim')
call dein#add('nacitar/a.vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-surround')
call dein#add('Shougo/vimproc.vim')
call dein#add('idanarye/vim-vebugger')
call dein#add('dbakker/vim-paragraph-motion')

" Undo tree navigation
" call dein#add('sjl/gundo.vim')
call dein#add('simnalamburt/vim-mundo')

" Fuzzy file search
call dein#add('nvim-lua/popup.nvim')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-lua/telescope.nvim')
call dein#add('junegunn/fzf', {
    \ 'dir': '~/.fzf', 
    \ 'build': './install --all' 
    \ })
call dein#add('junegunn/fzf.vim')

" Code completion
" call dein#add('Shougo/deoplete.nvim')
" call dein#add('autozimu/LanguageClient-neovim', {
"     \ 'rev': 'next',
"     \ 'build': 'bash install.sh',
"     \ })
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'build': 'yarn install --frozen-lockfile' })
call dein#add('kevinoid/vim-jsonc')

" Linting
call dein#add('dense-analysis/ale')
" call dein#add('vim-scripts/cpp_cppcheck.vim') " Not necessary; ale includes cppcheck

call dein#add('vim-airline/vim-airline')

call dein#add('tomtom/tcomment_vim')
"call dein#add('tpope/vim-commentary') " don't use; same as tcomment_vim but can't uncomment paragraph of Ada code
"call dein#add('scrooloose/nerdcommenter') " don't use - no motions

call dein#add('mhinz/vim-startify')

" To learn:
"call dein#add('fntlnz/atags.vim')
"call dein#add('steffanc/cscopemaps.vim')
"call dein#add('tpope/vim-abolish')
"call dein#add('godlygeek/tabular')
"call dein#add('neomake/neomake')
"call dein#add('chrisbra/Recover.vim')
"call dein#add('nelstrom/vim-markdown-folding')
"call dein#add('tpope/vim-ragtag')

" git
call dein#add('mhinz/vim-signify')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rhubarb')
call dein#add('rhysd/conflict-marker.vim')
call dein#add('stsewd/fzf-checkout.vim')
" call dein#add('airblade/vim-gitgutter')
" call dein#add('jreybert/vimagit')
" history browsing
call dein#add('junegunn/gv.vim')
call dein#add('rbong/vim-flog')
call dein#add('int3/vim-extradite')

call dein#add('chrisbra/SudoEdit.vim')

call dein#add('roggan87/vim-bible')

