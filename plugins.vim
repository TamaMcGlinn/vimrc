
" Programming languages
Plug 'TamaMcGlinn/Ada-Bundle'

"Plug 'vim-scripts/taglist.vim'

" Automatic tags management
" Plug 'ludovicchabant/vim-gutentags'

" Autocompletion plugin
Plug 'hrsh7th/nvim-compe'

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
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
" Plug 'ycm-core/YouCompleteMe'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'kevinoid/vim-jsonc'
Plug 'ktchen14/cscope-auto'
" Plug 'Chiel92/vim-autoformat'
Plug '~/code/vimplugins/vim-autoformat'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'davidhalter/jedi-vim'

" Refactoring
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tree-sitter/tree-sitter-typescript'
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/popup.nvim'
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
Plug 'AndrewRadev/switch.vim'

" Fix gx
" Fix gx see https://github.com/vim/vim/issues/4738
" Plug 'felipec/vim-sanegx'
Plug '~/code/vimplugins/vim-sanergx'

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

" --------------  git -----------------
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" GBrowse handlers:
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'TamaMcGlinn/vim-gerritbrowse'

Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'sodapopcan/vim-twiggy'
Plug 'ThePrimeagen/git-worktree.nvim'
" Plug '~/code/vimplugins/git-worktree.nvim'
Plug 'TamaMcGlinn/flog-teamjump.vim'
Plug '~/code/vimplugins/vim-instaflog'

Plug 'farmergreg/vim-lastplace'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Space menu
Plug 'liuchengxu/vim-which-key'

Plug 'skywind3000/vim-quickui'
" Plug 'rbong/vim-flog'
Plug 'TamaMcGlinn/vim-flog'
" Plug '~/code/vimplugins/vim-flog'
" Plug 'TamaMcGlinn/vim-flogmenu'
Plug '~/code/vimplugins/vim-flogmenu'

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
Plug '~/code/vimplugins/vim-bettergf'

Plug 'ryanoasis/vim-devicons'
" vim-devicons must be the last plugin
