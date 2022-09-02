
" Programming languages
Plug 'TamaMcGlinn/Ada-Bundle'

"Plug 'vim-scripts/taglist.vim'

" Automatic tags management
" Plug 'ludovicchabant/vim-gutentags'

Plug 'dyng/ctrlsf.vim'
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'yegappan/mru'
Plug 'vim-scripts/YankRing.vim'

" Alternating related files
" Plug 'nacitar/a.vim'
" Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'TamaMcGlinn/CurtineIncSw.vim'
Plug 'tpope/vim-projectionist'

Plug 'ii14/exrc.vim'

" Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'dbakker/vim-paragraph-motion'

" Debugging
Plug 'idanarye/vim-vebugger'
Plug 'puremourning/vimspector', {
      \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
      \ }
Plug 'szw/vim-maximizer'
Plug 'alepez/vim-gtest'

" Undo tree navigation
Plug 'simnalamburt/vim-mundo'

" Sublime / VS Code minimap
Plug 'wfxr/minimap.vim'

" File Outline Tags
Plug 'preservim/tagbar'

" Marks see also ~/vimrc/marks.vim
" Plug 'chentau/marks.nvim'

" Fuzzy file search
" Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'tknightz/telescope-termfinder.nvim'
Plug 'junegunn/fzf', {
    \ 'dir': '~/.fzf', 
    \ 'do': './install --all' 
    \ }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'TamaMcGlinn/vim-agtypes'
Plug 'markonm/traces.vim'
Plug 'valloric/listtoggle'

" Harpoon
Plug 'ThePrimeagen/harpoon'

" Code completion / LSP
Plug 'TamaMcGlinn/nvim-lsp-gpr-selector'
Plug 'TamaMcGlinn/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" no longer used:
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
" Plug 'ycm-core/YouCompleteMe'
" Plug 'nvim-lua/completion-nvim'

" command mode completion
Plug 'j5shi/CommandlineComplete.vim'

Plug 'kevinoid/vim-jsonc'
Plug 'ktchen14/cscope-auto'
Plug 'Chiel92/vim-autoformat'
Plug 'TamaMcGlinn/abe-ada-options'

" Refactoring
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tree-sitter/tree-sitter-typescript'
Plug 'nvim-treesitter/playground'
" Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/refactoring.nvim'

" Linting
" Plug 'dense-analysis/ale'
" Plug 'vim-syntastic/syntastic'
" Plug 'vim-scripts/cpp_cppcheck.vim' " Not necessary; ale includes cppcheck

" Snippets http://vimcasts.org/episodes/meet-ultisnips/
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Swap true / false, && || etc with gs
Plug 'AndrewRadev/switch.vim'

" Fix gx
" Fix gx see https://github.com/vim/vim/issues/4738
" Plug 'felipec/vim-sanegx'
Plug 'TamaMcGlinn/vim-sanergx'


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
Plug 'TamaMcGlinn/vim-codefmt'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'auwsmit/vim-active-numbers'

" See context
Plug 'nvim-treesitter/nvim-treesitter-context'
" Plug 'wellle/context.vm'

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

" --------------  git -----------------
Plug 'mhinz/vim-signify'

" GBrowse handlers:
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'TamaMcGlinn/vim-gerritbrowse'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Terminal stuff
Plug 'akinsho/toggleterm.nvim'
Plug 'TamaMcGlinn/vim-termhere'
Plug 'TamaMcGlinn/vim-dirhere'
Plug 'TamaMcGlinn/vim-browsedir'

" Space menu
Plug 'liuchengxu/vim-which-key'

" other git plugins
Plug 'sodapopcan/vim-twiggy'
Plug 'stsewd/fzf-checkout.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'aacunningham/vim-fuzzy-stash'
Plug 'sindrets/diffview.nvim'

Plug 'ThePrimeagen/git-worktree.nvim'


" Flog
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

" flog extensions
Plug 'skywind3000/vim-quickui'
Plug 'TamaMcGlinn/flog-menu'
Plug 'TamaMcGlinn/flog-teamjump'
Plug 'TamaMcGlinn/flog-forest'
Plug 'TamaMcGlinn/flog-navigate'


Plug 'TamaMcGlinn/vim-instaflog'

Plug 'dsummersl/vimunit'
Plug 'int3/vim-extradite'

Plug 'chrisbra/SudoEdit.vim'

Plug 'roggan87/vim-bible'

Plug 'TamaMcGlinn/quickfixdd'

Plug 'tpope/vim-eunuch'

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'roginfarrer/vim-dirvish-dovish'
Plug 'bounceme/remote-viewer'
Plug 'mcchrish/nnn.vim'

Plug 'voldikss/vim-floaterm'
Plug 'TamaMcGlinn/vim-bettergf'

Plug 'ryanoasis/vim-devicons'
" vim-devicons must be the last plugin
"
Plug 'TamaMcGlinn/vim-gitremotes'
