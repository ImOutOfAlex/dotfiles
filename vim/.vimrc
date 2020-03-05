if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'w0rp/ale'
Plug 'mattn/vim-lsp-settings'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()


" Styling
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set number list
" set lcs=tab:>-,eol:¬,nbsp:~,trail:•,extends:→,precedes:← sbr=↪
set lcs=trail:•,extends:→,precedes:← sbr=↪
let g:solarized_termtrans=1
let g:solarized_visibility="low"
set background=dark
colorscheme solarized


" LSP Config
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('racket')
    " raco install racket-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'racket-language-server',
        \ 'cmd': ['racket', '-l', 'racket-language-server'],
        \ 'whitelist': ['scheme'],
        \ })
endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
nmap <C-p> :Lines<CR>
cmap <C-p> Commands<CR>
imap <C-space> <Plug>(asyncomplete_force_refresh)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" Clipboard
let &clipboard = "unnamed"
let g:yoinkIncludeDeleteOperations = 1

" Commenter
imap <C-_> <esc>gccji
nmap <C-_> gccj


" netrw stuff
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> <C-p> :Files %<cr>
endfunction


" vim dispatch
autocmd FileType scheme let b:dispatch = 'raco test %'

if executable("pytest")
    autocmd FileType python let b:dispatch = 'pytest "%"'
elseif executable("nose")
    autocmd FileType python let b:dispatch = 'nose "%"'
elseif executable("python")
    autocmd FileType python let b:dispatch = 'python -m unittest "%"'
endif

nnoremap <C-d>    :Dispatch<CR>
inoremap <C-d>    <Esc>:Dispatch<CR>i
cnoremap <C-d>    <Esc>:Dispatch<CR>:

nnoremap <C-b>    :Make<CR>
inoremap <C-b>    <Esc>:Make<CR>i
cnoremap <C-b>    <Esc>:Make<CR>:


" for asyncomplete.vim log
let g:asyncomplete_auto_popup = 1
let g:lsp_auto_enable = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


" Tab navigation
nnoremap <C-s>    :w<CR>
inoremap <C-s>    <Esc>:w<CR>i
cnoremap <C-s>    <Esc>:w<CR>:

nnoremap <C-q>    :q<CR>
inoremap <C-q>    <Esc>:q<CR>i
cnoremap <C-q>    <Esc>:q<CR>:

nnoremap <C-S-Tab> :tabprevious<CR>
inoremap <C-S-Tab> <Esc>:tabprevious<CR>i
cnoremap <C-S-Tab> <Esc>:tabprevious<CR>:

nmap <C-Tab>   gt
inoremap <C-Tab>   <Esc>:tabnext<CR>i
cnoremap <C-Tab>   <Esc>:tabnext<CR>:

nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
cnoremap <C-t>     <Esc>:tabnew<CR>:
