syntax on

set background=dark
set autoindent            
set confirm
set cursorline            
set encoding=UTF-8
set formatexpr=xmlformat#Format()
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set nocompatible              
set noerrorbells
set nowrap
set number
set relativenumber
set showmatch
set smartcase
set smartindent           
set ts=2
set softtabstop=2
set sw=2
" set expandtab
set t_Co=256
set t_vb=
set noexpandtab
set updatetime=250
set visualbell
set wildmenu
set clipboard=unnamedplus
set splitbelow
set completeopt=noinsert,menuone,noselect 
set textwidth=119
set colorcolumn=+1 
set lbr
set laststatus=2
set switchbuf=newtab
" set magic=nomagic
set mouse=
set tags=./tags,tags;$HOME

" Verifica se as configuração estão no neovim
if has("nvim")
	autocmd TermOpen * startinsert
	set inccommand=split
endif

"----------- DEFINIÇÃO DE ESQUEMA DE CORES -----------
if (has("termguicolors"))
	set termguicolors
endif

" colorscheme OceanicNext 
colorscheme gruvbox 
" colorscheme dracula 
" colorscheme darcula 

let g:solarized_termcolors=256
let g:oceanic_next_terminal_bold   = 1
let g:oceanic_next_terminal_italic = 1
" --------------------------------------

"----------- CONFIGURAÇÃO DO EMMET-VIM ----------
autocmd FileType html,css EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_expandabbr_key = ',,'

"---------- CONFIGURAÃO DO AIRLINE ------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#disable_rtp_load = 1 

" Ultil snippets
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-y>"
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsSnippetsDir         = "~/.vim/plugged/ultisnips/"

" FZF
function! s:fzf_statusline()
	" Override statusline as you like
	highlight fzf1 ctermfg=161 ctermbg=251
	highlight fzf2 ctermfg=23 ctermbg=251
	highlight fzf3 ctermfg=237 ctermbg=251
	setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline() 

" PowerLine
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


" NerdTree
" Abrir o arquivo na mesma tela, dividindo na horizontal: Selecione o arquivo no NERDTree e pressione “i”
" Abrir o arquivo na mesma tela, dividindo na vertical: Selecione o arquivo no NERDTree e pressione “s”
" Abrir o arquivo em outra aba: Selecione o arquivo no NERDTree e pressione “t”
" Para chavear entre as abas: Pressione “g” e depois “t”, para próxima, ou “T” para a anterior, ou “#gt” para mudar para aba número #. Para facilitar, nas configurações têm uma função e um atalho para mudar de aba. H, move para aba anterior, e L, para a próxima.

let NERDTreeShowHidden = 1
" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
"" When open change the focus to the file (and not the NERDTree)
" autocmd! VimEnter * NERDTree | wincmd w
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" SUPERTAB ------------------------------------------
let g:SuperTabContextDefaultCompletionType = "<C-y>"
let g:SuperTabDefaultCompletionType = "<C-n>"

" Configuração NCM ----------------------------------

" Configurçaão TypeScript
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" Auto save session on quit vim
autocmd VimLeave * mksession! ~/.vimsession.vim
if filereadable("~/.vimsession.vim")
    source ~/mysession.vim
endif

"  Configurações para o coc.vim
set termguicolors
let g:coc_global_extensions = ['coc-snippets', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-json', 'coc-eslint', 'cod-phpls']
