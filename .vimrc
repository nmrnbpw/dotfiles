syntax on
colorscheme desert
" set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

set number
set relativenumber
set ruler

set cursorline
highlight CurosrLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CurosrLine gui=underline guifg=NONE guibg=NONE

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set showmatch
set showcmd

set autoindent
set smarttab

set nobackup
set noswapfile

set ignorecase
set wildmenu

" color pablo
" set background=light
" set background=dark
" set ttyfast
" set t_Co=256

set list
set listchars=tab:>-,extends:<,trail:-
set backspace=indent,eol,start

set hlsearch

set encoding=utf8

if has("gui_running")
  if has("windows")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set guifont=VL_Gothic_Regular:h10,Source_Code_Pro:h10
    " set guifont=Source_Code_Pro:h10
    set guifontwide=VL_Gothic_Regular:h10
    set ambiwidth=double

    " set imdisable
    set iminsert=0
    set imsearch=0
    inoremap <ESC> <ESC>:set iminsert=0<CR>

    set renderoptions=type:directx,renmode:5
  endif
endif

" compiler msvc
" set makeprg=nmake

if has('unix')
  language messages C
else
  language messages en
endif

cd ~

