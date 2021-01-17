call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
colorscheme nord
let g:airline_powerline_fonts = 1

let mapleader = ","
nmap <leader>b :NERDTreeToggle<cr>

"Insert new line without entering insert mode
nmap <leader>o o <Esc>

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

map <C-q> :q<CR>
map <C-b> :NERDTreeToggle<CR>

"Prevent using arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Remember the line when exits
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Close NERDTree when closing file or you can use :wqa "
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif


"NERDTree focus on file
"When vim starts, it opens a window for the file, then it opens another window for NerdTree.
"The easiest way to come back to the main window is just to jump to the previous window like this:

" Start NERDTree
autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

" netrw config
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

set noshowmode
set number
syntax on
set autoindent
set tabstop=2
set shiftwidth=2
set cursorline
