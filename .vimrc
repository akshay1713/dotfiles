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
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'dkprice/vim-easygrep'
"Plugin 'joonty/vim-phpunitqf.git'
Plugin 'SirVer/ultisnips'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'vim-airline/vim-airline'
"Plugin 'flowtype/vim-flow'
let g:javascript_plugin_jsdoc = 1
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
syntax on

"hide buffers instead of closing them
set hidden

"Search while typing
set incsearch

"highlight all search results
set hlsearch

"command mode autocomplete
set wildmenu

set ignorecase
set smartcase
set backspace=2
set laststatus=2
set visualbell

"confirm before quitting if unsaved buffers
set confirm

set relativenumber 
set number  

"go to function
map <c-]> g<c-]>


"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>l :set invnumber<CR>
let g:solarized_termcolors=256
set background=dark
colorscheme default 
let g:neocomplete#enable_at_startup = 1
"
"tell ctrlp to ignore certain directories
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git\|\node_modules\|fonts\|vendor\|plugins\|storage$' 
  \ }

"use ag while searching (not grep)
set grepprg=ag\ --nogroup\ --nocolor
set runtimepath^=~/.vim/bundle/ag
set completeopt-=preview

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"ctrlp cache
let g:ctrlp_cache_dir = '~/.cache/ctrlp'

"set tab to 4 spaces
set tabstop=4 softtabstop=4 expandtab shiftwidth=4

"Highlight current line
function! s:Cursor_Moved()
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
"
"split tabs right and below
set splitbelow
set splitright

"easier navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set foldmethod=indent
set foldlevel=99
set cursorline
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers=['']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

"faster buffer switching
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"enter something at end of line while in insert mode and come back
imap <silent><F3> <Esc>v`^me<Esc>gi<C-o>:call Ender()<CR>
function! Ender()
  let endchar = nr2char(getchar())
  execute "normal \<End>a".endchar
  normal `e
endfunction

"Use ag for grep in vim
set grepprg=ag\ --hidden\ --vimgrep
set grepformat=%f:%l:%c:%m

"Insert semi-colon at end and come back to position
nnoremap ,; m`A;<Esc>``
nnoremap <F3> :wa

" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"Prevent conflict between multiple cursors and neocomplete
"(https://github.com/terryma/vimmultiplecursors)
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
execute ":'<,'>normal @".nr2char(getchar())
endfunction
"Autodocument php code using tobyS/pdv
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap pd :call pdv#DocumentWithSnip()<CR>
autocmd InsertLeave * :w
nnoremap <c-l> :redraw! <CR>
nnoremap <Leader>ev :e ~/.vimrc <CR>
nnoremap <Leader>s :so ~/.vimrc <CR>
nnoremap <Leader>c :s/\v(\S),(\S)/\1, \2/g <CR>
nnoremap gp `[v`]
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
" Move up and down in neocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <Leader>c[ <S-%>r]<C-o>r[
nnoremap <Leader>c( <S-%>r)<C-o>r(
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y
inoremap <c-h> <Left>
inoremap <c-l> <Right>
nnoremap <Leader>fv :%s/\vfunction ([a-zA-Z]*)\s*\(([^)]*)\)/\1 : function(\2)/g <CR>
