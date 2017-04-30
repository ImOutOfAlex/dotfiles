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
call plug#end()

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

set number list
set lcs=tab:>-,eol:¬,nbsp:~,space:•,extends:→,precedes:← sbr=↪

let g:solarized_termtrans=1
let g:solarized_visibility="low"
set background=dark
colorscheme solarized