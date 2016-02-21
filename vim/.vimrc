" be iMproved, required
set nocompatible

" required by Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'

Plugin 'bling/vim-airline'
set laststatus=2
" enable modified detection
let g:airline_detect_modified=1

Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" Also required by Vundle
filetype indent plugin on

" enable syntax highlighting
syntax on

set background=dark
colorscheme Tomorrow-Night

" show line numbers
set number

" enable relative number
set relativenumber

" number of visual spaces per TAB
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" tabs are spaces
set expandtab

" show command in bottom bar
set showcmd

" highlight current line
set cursorline

" redraw only when we need to.
set lazyredraw

" highlight matching [{()}]
set showmatch

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" enable mouse
set mouse=a

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" enable 256 colors mode in gnome-terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
