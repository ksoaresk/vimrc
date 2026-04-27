let mapleader="\<space>"
nnoremap <leader>; A;<ESC>
nnoremap <leader>> A => 
nnoremap <leader>, A,<ESC>
nnoremap <leader>{ A{<ESC>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bf :bf<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>

" Coc-configuration
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

" Atalhos para o Terminal
inoremap <F12> <ESC>:sp \| term<CR>
nnoremap <F12> :sp \| term<CR>
tnoremap <F12> <C-\><C-n>:q!<CR> 
nnoremap <F9> :QuickRunExecute<CR>
" tnoremap <C-S-K> <C-\><C-n><C-w>k
" tnoremap <C-S-H> <C-\><C-n><C-w>j
" tnoremap <C-S-L> <C-\><C-n><C-w>l
" tnoremap <C-S-J> <C-\><C-n><C-w>j

" Fold code blocks
nnoremap <leader>fp vip:fold<CR>
nnoremap <leader>ft vit:fold<CR>
nnoremap <leader>f{ va{:fold<CR>
nnoremap <leader>f} va}:fold<CR>
nnoremap <leader>f[ va[:fold<CR>
nnoremap <leader>f] va]:fold<CR>

" Set syntax
nnoremap <leader>cfx :set syntax=xml<CR>
nnoremap <leader>cfh :set syntax=html<CR>
nnoremap <leader>cfp :set syntax=php<CR>
nnoremap <leader>cfj :%!jq .<CR>

" Mover linhas
nnoremap <M-k> ddkP
nnoremap <M-Up> ddkP
nnoremap <M-j> ddp
nnoremap <M-Down> ddp 

" Format file
nnoremap <M-f> gg=G 
noremap tt :tab split<CR>

" Resize panel
noremap <C-S-Up> :resize +2<CR>
noremap <C-S-Down> :resize -2<CR>
noremap <C-S-Right> :vertical resize +2<CR>
noremap <C-S-Left> :vertical resize -2<CR>
noremap <C-h> :set hlsearch!<CR>

map <F5>   :source ~/.vimrc <CR>
map <c-F5> :PluginInstall <CR>

" Navegação nos arquivos NerdTree
nmap <F7>                     : NERDTreeToggle <CR>
imap <F7> <ESC>               : NERDTreeToggle <CR>

" Tagbar navegação em métodos de classes
nmap  <F8>                    : TagbarToggle <CR>
imap  <F8><ESC>               : TagbarToggle <CR>

" Teclas para navegação em buscas no conteúdos dos arquivos com `vimgrep! /expression/g dir|file.ext`
map <F2> :copen<CR>
map <F3> :cclose<CR>
nnoremap <leader>sn :cnext<CR>
nnoremap <leader>sp :cprevious<CR> 

nnoremap <C-s> <ESC>:w! <CR>
nnoremap <C-q> <ESC>:qa! <CR>
nnoremap <C-e>          :tabclose <CR>
nnoremap <S-t>          :tabnew <CR>
nnoremap <S-tab>        :tabnext <CR>
inoremap <C-s> <ESC>:w! <CR> 
" inoremap <F9> <C-R>=strftime('%s')<CR> 
inoremap <leader>exco <C-R>=strftime('%s')<CR> 

" GIT------------------------------------------------------------
let g:gitgutter_sign_modified = '>'
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gp :GitGutterPrevHunk<CR> 
inoremap <leader>dff <ESC> :Gdiff<CR> " Git Diff in insertion mode
nnoremap <leader>dff :Gdiff<CR> " Git Diff in normal mode
nnoremap <leader>gb :Git blame<CR>

" serilize and unserialize php
vmap <leader>s <esc>:'<,'> !php -r 'echo serialize(eval("return " . file_get_contents("php://stdin") . ";"));'<CR>
vmap <leader>u <esc>:'<,'> !php -r 'var_export(unserialize(file_get_contents("php://stdin")));'<CR>

" ATALHOS PARA PHP REFACTOR ----------------------
" nnoremap <unique> <Leader>rlv :call PhpRenameLocalVariable()<CR>
" nnoremap <unique> <Leader>rcv :call PhpRenameClassVariable()<CR>
" nnoremap <unique> <Leader>rm :call PhpRenameMethod()<CR>
" nnoremap <unique> <Leader>eu :call PhpExtractUse()<CR>
" vnoremap <unique> <Leader>ec :call PhpExtractConst()<CR>
" nnoremap <unique> <Leader>ep :call PhpExtractClassProperty()<CR>
" vnoremap <unique> <Leader>em :call PhpExtractMethod()<CR>
" nnoremap <unique> <Leader>np :call PhpCreateProperty()<CR>
" nnoremap <unique> <Leader>du :call PhpDetectUnusedUseStatements()<CR>
" vnoremap <unique> <Leader>== :call PhpAlignAssigns()<CR>
" nnoremap <unique> <Leader>sg :call PhpCreateSettersAndGetters()<CR>
" nnoremap <unique> <Leader>cog :call PhpCreateGetters()<CR>
" nnoremap <unique> <Leader>da :call PhpDocAll()<CR> 


" Comandos para FZF
nnoremap <C-p> :GFiles<CR>
nnoremap <C-i> :Files<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-e> :Rg<CR>
nnoremap <S-b> :Buffers<CR>
inoremap <M-s> <ESC>:Snippts<CR>
