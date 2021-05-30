
" Programming languages
Plug 'TamaMcGlinn/Ada-Bundle'

"Plug 'vim-scripts/taglist.vim'

Plug 'dyng/ctrlsf.vim'
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/YankRing.vim'

Plug 'nacitar/a.vim'
Plug 'tpope/vim-projectionist'

Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'dbakker/vim-paragraph-motion'

" Debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'alepez/vim-gtest'

" Undo tree navigation
Plug 'simnalamburt/vim-mundo'

" Sublime / VS Code minimap
Plug 'wfxr/minimap.vim'

" File Outline Tags
Plug 'preservim/tagbar'

" Fuzzy file search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'junegunn/fzf', {
    \ 'dir': '~/.fzf', 
    \ 'do': './install --all' 
    \ }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'markonm/traces.vim'
Plug 'valloric/listtoggle'

" Code completion
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'kevinoid/vim-jsonc'
Plug 'ktchen14/cscope-auto'
" Plug 'Chiel92/vim-autoformat'
Plug '~/code/vimplugins/vim-autoformat'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Linting
" Plug 'dense-analysis/ale'
" Plug 'vim-scripts/cpp_cppcheck.vim' " Not necessary; ale includes cppcheck

" Snippets http://vimcasts.org/episodes/meet-ultisnips/
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'AndrewRadev/switch.vim'

Plug 'morhetz/gruvbox'
" Plug 'vim-scripts/visSum.vim'
Plug 'glexey/visSum.vim'
Plug 'vim-airline/vim-airline'

Plug 'tomtom/tcomment_vim'
"Plug 'tpope/vim-commentary' " don't use; same as tcomment_vim but can't uncomment paragraph of Ada code
"Plug 'scrooloose/nerdcommenter' " don't use - no motions

Plug 'mhinz/vim-startify'

" Build systems
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Code formatting
Plug 'google/vim-glaive'
" Plug 'google/vim-codefmt'
Plug '~/code/vimplugins/vim-codefmt'
" Plug 'google/vim-glaive'

Plug 'farmergreg/vim-lastplace'

Plug 'dbeniamine/cheat.sh-vim'

Plug 'nelstrom/vim-markdown-folding'

" To learn:
"Plug 'fntlnz/atags.vim'
"Plug 'steffanc/cscopemaps.vim'
"Plug 'tpope/vim-abolish'
"Plug 'neomake/neomake'
"Plug 'chrisbra/Recover.vim'
"Plug 'tpope/vim-ragtag'

" Excel
"Plug 'godlygeek/tabular'
Plug 'sk1418/HowMuch'
Plug 'junegunn/vim-easy-align' " vip :EasyAlign ,

" git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'sodapopcan/vim-twiggy'
Plug 'ThePrimeagen/git-worktree.nvim'
" Plug '~/code/vimplugins/git-worktree.nvim'
Plug 'TamaMcGlinn/vim-gerritbrowse'
Plug 'TamaMcGlinn/flog-teamjump.vim'
Plug '~/code/vimplugins/vim-instaflog'

Plug 'farmergreg/vim-lastplace'

" Space menu
Plug 'liuchengxu/vim-which-key'

Plug 'skywind3000/vim-quickui'
" Plug 'rbong/vim-flog'
Plug '~/code/vimplugins/vim-flog'
" Plug 'TamaMcGlinn/vim-flogmenu'
Plug '~/code/vimplugins/vim-flogmenu'

Plug 'dsummersl/vimunit'
Plug 'int3/vim-extradite'

Plug 'chrisbra/SudoEdit.vim'

Plug 'roggan87/vim-bible'

Plug 'TamaMcGlinn/quickfixdd'

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'bounceme/remote-viewer'

Plug 'voldikss/vim-floaterm'

Plug 'ryanoasis/vim-devicons'
" vim-devicons must be the last plugin
