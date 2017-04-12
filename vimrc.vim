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
call plug#end()


filetype plugin indent on    " required
set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set background=dark
colorscheme solarized
hi Normal ctermbg=none
highlight NonText ctermbg=none
