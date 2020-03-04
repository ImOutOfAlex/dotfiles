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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set number list
set lcs=tab:>-,eol:¬,nbsp:~,space:•,extends:→,precedes:← sbr=↪
let g:solarized_termtrans=1
let g:solarized_visibility="low"
set background=dark
colorscheme solarized


if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('racket')
    " racket
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
nmap <C-a> FZF
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


" for asyncomplete.vim log
let g:asyncomplete_auto_popup = 1
let g:lsp_auto_enable = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


