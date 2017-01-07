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
map <c-]> g<c-]>
set incsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap nt :NERDTreeToggle<CR>
nnoremap ln :set invnumber<CR>
let g:solarized_termcolors=256
set background=dark
colorscheme default 
let g:neocomplete#enable_at_startup = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git\|node_modules\|fonts\|vendor\|plugins\|storage$' 
  \ }
set grepprg=ag\ --nogroup\ --nocolor
set runtimepath^=~/.vim/bundle/ag
set completeopt-=preview
let g:ctrlp_cache_dir = '~/.cache/ctrlp'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  "let g:ctrlp_use_caching = 0
endif
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
"augroup BgHighlight
    "autocmd!
    "autocmd WinEnter * set cul
    "autocmd WinLeave * set nocul
"augroup END
function s:Cursor_Moved()
  let cur_pos = winline()
  if g:last_pos == 0
    set cul
    let g:last_pos = cur_pos
    return
  endif
  let diff = g:last_pos - cur_pos
  if diff > 1 || diff < -1
    set cul
  else
    set nocul
  endif
  let g:last_pos = cur_pos
endfunction
"autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
let g:last_pos = 0
nnoremap <F5> :buffers<CR>:buffer<Space>
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set foldmethod=indent
set foldlevel=99
