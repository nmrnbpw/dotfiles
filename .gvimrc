" color scheme
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
set t_Co=256

if has("gui_running")
  " vim-airline
  let g:airline_solarized_bg='dark'
  let g:airline_theme='solarized'
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#show_buffers=1
  let g:airline#extensions#tabline#buffer_nr_show=1
  let g:airline#extensions#tabline#show_tabs=0

  let g:airline_powerline_fonts=1
  let g:Powerline_symbols='unicode'

  set termguicolors
  set cursorline
  set cursorcolumn
  highlight CurosrLine cterm=underline ctermfg=NONE ctermbg=NONE
  highlight CurosrLine gui=underline guifg=NONE guibg=NONE
endif

