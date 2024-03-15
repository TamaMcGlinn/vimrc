
" Programming languages
Plug 'TamaMcGlinn/vim-ada'

"Plug 'vim-scripts/taglist.vim'

" Automatic tags management
" Plug 'ludovicchabant/vim-gutentags'

Plug 'dyng/ctrlsf.vim'

Plug 'yegappan/mru'
Plug '~/code/vimplugins/nvim-termhelp'

" Yank history
" YankRing periodically causes me to paste the entire git history into a CMD
" buffer, which necessitates killing the nvim process
" Plug 'vim-scripts/YankRing.vim'
Plug 'gbprod/yanky.nvim'
" see lua/yank_and_paste.lua


" Alternating related files
" Plug 'nacitar/a.vim'
Plug 'TamaMcGlinn/CurtineIncSw.vim'
Plug 'tpope/vim-projectionist'

Plug 'farmergreg/vim-lastplace'

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
Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }
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
Plug 'kshenoy/vim-signature'

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
Plug 'TamaMcGlinn/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" no longer used:
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
" Plug 'ycm-core/YouCompleteMe'
" Plug 'nvim-lua/completion-nvim' " deprecated

" Ada
Plug 'TamaMcGlinn/nvim-lsp-gpr-selector'

" command mode completion
Plug 'j5shi/CommandlineComplete.vim'

Plug 'kevinoid/vim-jsonc'
Plug 'ktchen14/cscope-auto'
Plug 'Chiel92/vim-autoformat'
Plug 'TamaMcGlinn/abe-ada-options'

" markdown
Plug 'tpope/vim-markdown'
Plug 'mikeboiko/vim-markdown-folding'
Plug 'moorereason/vim-markdownfmt'

" Refactoring
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'briot/tree-sitter-ada'
Plug 'tree-sitter/tree-sitter-typescript'
Plug 'nvim-treesitter/playground'
" Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'AndrewRadev/sideways.vim'

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

Plug 'MunifTanjim/nui.nvim'

" ChatGPT
Plug 'dpayne/CodeGPT.nvim'
Plug 'archibate/nvim-gpt'

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
Plug 'TamaMcGlinn/vim-bazeljump'
Plug 'stevearc/overseer.nvim', {'commit': '68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0'}
Plug 'Zeioth/compiler.nvim'
Plug 'Zeioth/makeit.nvim'

" Code formatting
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'auwsmit/vim-active-numbers'

" See context
Plug 'nvim-treesitter/nvim-treesitter-context'
" Plug 'wellle/context.vm'

Plug 'farmergreg/vim-lastplace'

" Plug 'dbeniamine/cheat.sh-vim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

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
Plug 'nvim-tree/nvim-web-devicons'
Plug 'sindrets/diffview.nvim'

Plug 'TamaMcGlinn/vim-git-essentials', { 'branch': 'v2' }
Plug 'TamaMcGlinn/vim-floggit-keybindings', { 'branch': 'v2' }
Plug 'TamaMcGlinn/git-worktree.nvim'


" chat
Plug 'colmbus72/slim'

" Flog
Plug 'TamaMcGlinn/vim-fugitive', { 'branch': 'footbazooka' }
Plug 'TamaMcGlinn/vim-flog', { 'branch': 'master' }

" flog extensions
Plug 'skywind3000/vim-quickui'
Plug 'TamaMcGlinn/flog-menu', { 'branch': 'v2' }
Plug 'TamaMcGlinn/flog-teamjump'
" Plug 'TamaMcGlinn/flog-forest'
Plug 'TamaMcGlinn/flog-navigate', { 'branch': 'v2' }
Plug 'TamaMcGlinn/vim-autoflog', { 'branch': 'v2' }


Plug 'TamaMcGlinn/vim-instaflog'

Plug 'dsummersl/vimunit'
Plug 'int3/vim-extradite'

Plug 'chrisbra/SudoEdit.vim'

Plug 'roggan87/vim-bible'

Plug 'TamaMcGlinn/quickfixdd'

Plug 'cormacrelf/trouble.nvim', { 'branch': 'cascading-sev-2' }

Plug 'tpope/vim-eunuch'

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'roginfarrer/vim-dirvish-dovish'
Plug 'bounceme/remote-viewer'

Plug 'voldikss/vim-floaterm'
Plug 'TamaMcGlinn/vim-bettergf'

Plug 'ryanoasis/vim-devicons'
" vim-devicons must be the last plugin
"
Plug 'TamaMcGlinn/vim-gitremotes'
Plug 'uga-rosa/translate.nvim'

Plug 'TamaMcGlinn/vim-fuzzy-recent'

Plug '~/code/vimplugins/nvim-alire-tools/'
