set nocompatible
set nocompatible
let g:has_async = v:version >= 800 || has('nvim')

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ervandew/supertab'

if g:has_async
	Plug 'w0rp/ale'
endif

call plug#end()

set number
set relativenumber
set numberwidth=5

set nowrap

set splitbelow
set splitright

set tabstop=4
set shiftwidth=0

set ignorecase
set smartcase
