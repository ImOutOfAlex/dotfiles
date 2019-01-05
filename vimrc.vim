if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'francoiscabrol/ranger.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'gburca/vim-logcat'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'mtscout6/syntastic-local-eslint.vim'
call plug#end()

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set number list
set lcs=tab:>-,eol:¬,nbsp:~,space:•,extends:→,precedes:← sbr=↪

let g:solarized_termtrans=1
let g:solarized_visibility="low"
set background=dark
colorscheme solarized

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = 'python3'

