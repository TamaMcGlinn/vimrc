
" Programming languages
Plug 'TamaMcGlinn/Ada-Bundle'

"Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/YankRing.vim'

" Plug 'nacitar/a.vim'
Plug 'tpope/vim-projectionist'

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

" Fuzzy file search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'junegunn/fzf', {
    \ 'dir': '~/.fzf', 
    \ 'do': './install --all' 
    \ }
Plug 'junegunn/fzf.vim'

" Code completion
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'kevinoid/vim-jsonc'
Plug 'chazy/cscope_maps'
Plug 'ktchen14/cscope-auto'

" Linting
" Plug 'dense-analysis/ale'
" Plug 'vim-scripts/cpp_cppcheck.vim' " Not necessary; ale includes cppcheck

" Snippets http://vimcasts.org/episodes/meet-ultisnips/
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'morhetz/gruvbox'
Plug 'vim-scripts/visSum.vim'
Plug 'vim-airline/vim-airline'

Plug 'tomtom/tcomment_vim'
"Plug 'tpope/vim-commentary' " don't use; same as tcomment_vim but can't uncomment paragraph of Ada code
"Plug 'scrooloose/nerdcommenter' " don't use - no motions

Plug 'mhinz/vim-startify'

" Build systems
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Code formatting
Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'

Plug 'farmergreg/vim-lastplace'

Plug 'dbeniamine/cheat.sh-vim'

" To learn:
"Plug 'fntlnz/atags.vim'
"Plug 'steffanc/cscopemaps.vim'
"Plug 'tpope/vim-abolish'
"Plug 'neomake/neomake'
"Plug 'chrisbra/Recover.vim'
"Plug 'nelstrom/vim-markdown-folding'
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
Plug 'stsewd/fzf-checkout.vim'
Plug 'sodapopcan/vim-twiggy'

" Space menu
Plug 'dpretet/vim-leader-mapper'

Plug 'skywind3000/vim-quickui'
" Plug 'rbong/vim-flog'
Plug '~/code/vimplugins/vim-flog'
" Plug 'TamaMcGlinn/vim-flogmenu'
Plug '~/code/vimplugins/vim-flogmenu'

Plug 'int3/vim-extradite'

Plug 'chrisbra/SudoEdit.vim'

Plug 'roggan87/vim-bible'

Plug 'TamaMcGlinn/quickfixdd'

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'bounceme/remote-viewer'

