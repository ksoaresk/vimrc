" Codificação
Plug 'ap/vim-css-color'                        " Emmet html e CSS
Plug 'mattn/emmet-vim'                         " Emmet html e CSS
Plug 'ervandew/supertab'                       " Super tab para autocompletes entre outros
Plug 'terryma/vim-multiple-cursors'            " Vim multiplos cursores
Plug 'tpope/vim-surround'                      " Adiciona fechamentos
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'                        " gerenciamento e uso de snips
Plug 'chrisbra/vim-xml-runtime'                " Tratamento e formatação de XML de forma dinamica
Plug 'majutsushi/tagbar'                       " Navegador de estrutura
Plug 'vim-syntastic/syntastic'                 " análise de sintaxe
Plug 'stephpy/vim-php-cs-fixer'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'tobyS/pdv' 
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'} 
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'cohama/lexima.vim'
Plug 'arnaud-lb/vim-php-namespace'
" Plug 'augmentcode/augment.vim'

"JavaScript
Plug 'jparise/vim-graphql'        
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty' 
Plug 'peitalin/vim-jsx-typescript'
Plug 'tasn/vim-tsx'
Plug 'yuezk/vim-js'
Plug 'mlaursen/vim-react-snippets'
Plug 'Valloric/MatchTagAlways'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}\


" If you have nodejs
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
