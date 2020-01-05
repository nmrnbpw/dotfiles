set encoding=utf-8
scriptencoding utf-8

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=d:/software/vim/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('d:/software/vim/.')
  call dein#begin('d:/software/vim/.')

  " Let dein manage dein
  " Required:
  call dein#add('d:/software/vim/./repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('altercation/vim-colors-solarized')

  call dein#add('ryanoasis/vim-devicons')
  " call dein#add('liuchengxu/vista.vim')

  call dein#add('scrooloose/nerdtree')
  call dein#add('thinca/vim-quickrun')
  call dein#add('Shougo/denite.nvim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


syntax on
" colorscheme desert
" set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

if has("gui_running")
  set background=dark
  colorscheme solarized
  let g:solarized_termcolors=256

  " vim-airline
  let g:airline_solarized_bg='dark'
  let g:airline_theme='solarized'
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#show_buffers=1
  let g:airline#extensions#tabline#buffer_nr_show=1
  let g:airline#extensions#tabline#show_tabs=0

  let g:airline_powerline_fonts=1
  let g:Powerline_symbols='unicode'

  " NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  let g:NERDTreeShowHidden=1
  let g:NERDTreeDirArrows=1
  " let g:NERDTreeDirArrowExpandable = '▸'
  " let g:NERDTreeDirArrowCollapsible = '▾'

  set cursorline
  set cursorcolumn
  highlight CurosrLine cterm=underline ctermfg=NONE ctermbg=NONE
  highlight CurosrLine gui=underline guifg=NONE guibg=NONE
endif


set number
set relativenumber
set ruler
set laststatus=2
set cmdheight=2
set termguicolors
set scrolloff=8

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set showmatch
set matchpairs& matchpairs+=<:>
set matchtime=3
set showcmd

set autoindent
set smarttab

set nobackup
set noswapfile
set undofile
if has('unix')
  set undodir=/tmp/.vimundo_$USER
else
  set undodir=$TMP\_vimundo_$USERNAME
endif

set ignorecase
set wildmenu
set completeopt=menuone,noinsert
set breakindent

" color pablo
" set background=light
" set background=dark
" set ttyfast
" set t_Co=256

set list
" set listchars=tab:>-,extends:<,trail:-
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set backspace=indent,eol,start

set hlsearch

set belloff=all

set hidden

vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

let mapleader="\<BS>"

vmap <Leader>y "*y

nmap <Leader>y ggVG"*y``
nmap <Leader>p "*p
nmap <Leader>P ggVGd"*P
nmap <Leader>v ggVG


map <Leader><Up> :bd<CR>
map <Leader><Left> :bprev<CR>
map <Leader><Right> :bnext<CR>

map <Leader>h :bprev<CR>
map <Leader>l :bnext<CR>
map <Leader>H :bfirst<CR>
map <Leader>L :blast<CR>

map <Leader>f :NERDTreeToggle<CR>

if has("gui_running")
  if has("windows")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set guioptions-=e

    " set guifont=VL_Gothic_Regular:h11,Source_Code_Pro:h11
    " set guifont=NasuM:h11:cSHIFTJIS:qDRAFT,Source_Code_Pro:h11
    " set guifont=Cica:h12:cSHIFTJIS:qDRAFT,Source_Code_Pro:h11
    " set guifont=Source_Code_Pro:h10
    " set guifontwide=VL_Gothic_Regular:h11
    " set renderoptions=type:directx,renmode:5

    set guifont=Cica:h12:cDEFAULT:qDRAFT
    set printfont=Cica:h8
    set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
    set ambiwidth=double

    " set imdisable
    set iminsert=0
    set imsearch=0
    inoremap <ESC> <ESC>:set iminsert=0<CR>
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

