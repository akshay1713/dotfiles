set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/neocomplete'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'fatih/vim-go'
Plugin 'ternjs/tern_for_vim'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
syntax on
set hidden
set hlsearch
set wildmenu
set ignorecase
set smartcase
set backspace=2
set laststatus=2
set confirm
set visualbell
set pastetoggle=<F12>
