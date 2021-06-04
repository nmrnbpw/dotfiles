set encoding=utf-8
scriptencoding utf-8

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif


" Required:
if has('unix')
  let s:cache_home=empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
  let s:dein_dir=s:cache_home . '/dein'
  let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'
else
  let s:cache_home=$VIM . '\.cache'
  let s:dein_dir=s:cache_home . '\dein'
  let s:dein_repo_dir=s:dein_dir . '\repos\github.com\Shougo\dein.vim'
endif

" Required:
let &runtimepath=s:dein_repo_dir .",". &runtimepath
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)

  call dein#add('vim-jp/vimdoc-ja')

  " Add or remove your plugins here:
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')

  call dein#add('kana/vim-operator-user')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-operator-replace')
  call dein#add('tpope/vim-surround')
  call dein#add('rhysd/vim-operator-surround')
  call dein#add('nathanaelkane/vim-indent-guides')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/deoppet.nvim')

  call dein#add('junegunn/fzf', { 'build': './install' })
  call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fzf' })
  call dein#add('dense-analysis/ale')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('tpope/vim-fugitive')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('altercation/vim-colors-solarized')

  call dein#add('ryanoasis/vim-devicons')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('kristijanhusak/defx-git')
  call dein#add('liuchengxu/vista.vim')

  " call dein#add('scrooloose/nerdtree')
  call dein#add('thinca/vim-quickrun')

  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite-outline')

  call dein#add('neoclide/coc.nvim')

  call dein#add('rust-lang/rust.vim')

  " call dein#add('reconquest/vim-pythonx')

  " call dein#add('prabirshrestha/vim-lsp')
  " call dein#add('mattn/vim-lsp-settings')

  " call dein#add('prabirshrestha/asyncomplete.vim')
  " call dein#add('prabirshrestha/asyncomplete-lsp.vim')

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


let g:solarized_termtrans=1
syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" colorscheme desert
" set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

" ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ale
set signcolumn=yes
let g:ale_sign_column_always = 1
let g:ale_fix_on_save=1
let g:ale_ling_on_text_changed=0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" vim-operator-surround
map sa <Plug>(operator-surround-append)
map sd <Plug>(operator-surround-delete)a
map sr <Plug>(operator-surround-replace)a

let g:operator#surround#blocks = {}
let g:operator#surround#blocks['-'] = [
    \   { 'block' : ['（', '）'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['P'] },
    \   { 'block' : ['「', '」'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['B'] },
    \   { 'block' : ['『', '』'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['D'] },
    \   { 'block' : ['【', '】'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['S'] },
    \   { 'block' : ['＜', '＞'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['Y'] },
    \   { 'block' : ['｛', '｝'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['N'] },
    \   { 'block' : ['〔', '〕'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['K'] },
    \   { 'block' : ['《', '》'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['Z'] },
    \ ]

" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>G :GFiles?<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>r :Rg<CR>

" vimdoc-ja
:set helplang=ja,en

" NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" let g:NERDTreeShowHidden=1
" let g:NERDTreeDirArrows=1
" " let g:NERDTreeDirArrowExpandable = '▸'
" " let g:NERDTreeDirArrowCollapsible = '▾'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
" " アイコン入力方法 : `[Ctrl+V]` > `[u]` > `e905`
" let g:NERDTreeExtensionHighlightColor = {}
" let g:NERDTreeExtensionHighlightColor['vue'] = '42B983'

" vim-airline
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#wgutesoace=1

if has("gui_running")
  let g:airline_powerline_fonts=1
  let g:Powerline_symbols='unicode'
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''

if has("gui_running")
  set termguicolors
  set cursorline
  set cursorcolumn
  highlight CurosrLine cterm=underline ctermfg=NONE ctermbg=NONE
  highlight CurosrLine gui=underline guifg=NONE guibg=NONE
endif


if has('unix')
  let g:python3_host_prog = expand('$HOME/usr/bin/python3') 
else
  let g:python3_host_prog = expand('~\AppData\Local\Programs\Python\Python39\python.exe')
endif

" rust
let g:rustfmt_autosave = 1

" Vista
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" Defx
" nnoremap <silent> <Leader>f :<C-u> Defx <CR>
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
   \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('open','tabnew')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('drop', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

call defx#custom#option('_', {
      \ 'winwidth': 32,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': 'defx',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'columns': 'indent:git:icons:filename:mark',
      \ })

autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })


set number
set relativenumber
set ruler
set laststatus=2
set cmdheight=2
" set scrolloff=8

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set showmatch
set matchpairs& matchpairs+=<:>,「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”,｛:｝,〔:〕
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

" set clipboard=unnamed

set ignorecase
set incsearch
set wrapscan
set smartcase
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
set autochdir

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

" map <Leader>f :NERDTreeToggle<CR>

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

" Denite
" Change file/rec command 
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Ripgrep command on grep source
call denite#custom#var('grep', {
           \ 'command': ['rg'],
           \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
           \ 'recursive_opts': [],
           \ 'pattern_opt': ['--regexp'],
           \ 'separator': ['--'],
           \ 'final_opts': [],
           \ })

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])
"



cd ~

