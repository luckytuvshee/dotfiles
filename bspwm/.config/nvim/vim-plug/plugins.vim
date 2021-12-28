" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "atocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Theme 
    Plug 'arcticicestudio/nord-vim'
    " Status
    Plug 'vim-airline/vim-airline'
    " Intellisense
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Look Up Key Bindings
    Plug 'liuchengxu/vim-which-key'
    " LaTeX Support
    Plug 'lervag/vimtex'
    " LaTeX Linting
    " Plug 'dense-analysis/ale'
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

    call plug#end()


