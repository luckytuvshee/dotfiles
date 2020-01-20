call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
call plug#end()

set background=dark
colorscheme nord
let g:airline_powerline_fonts = 1

set noshowmode
set number
syntax on
set autoindent
set tabstop=2
set shiftwidth=4
set cursorline
