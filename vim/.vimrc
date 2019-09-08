if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
" Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'gburca/vim-logcat'
" Plug 'godlygeek/tabular'
" Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
" Plug 'vim-syntastic/syntastic'
" Plug 'mtscout6/syntastic-local-eslint.vim'
" Plug 'nvie/vim-flake8'
Plug 'w0rp/ale'
call plug#end()

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set number list
set lcs=tab:>-,eol:¬,nbsp:~,space:•,extends:→,precedes:← sbr=↪

let g:solarized_termtrans=1
let g:solarized_visibility="low"
set background=dark
colorscheme solarized

imap <c-space> <Plug>(asyncomplete_force_refresh)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

let g:lsp_auto_enable = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:airline#extensions#ale#enabled = 1

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


