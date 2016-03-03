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
" always display the gutter, avoid window changing size
let g:gitgutter_sign_column_always=1

Plugin 'gabrielelana/vim-markdown'
let g:markdown_enable_spell_checking=0

" require livedown to be installed. yaourt livedown
Plugin 'shime/vim-livedown'

Plugin 'tpope/vim-sleuth'

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

" set leader key
let mapleader=" "

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

" enable smart indent
set smartindent

" enable auto indent
set autoindent

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

" ability to cancel a search with Esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" enable mouse
set mouse=a

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" enable 256 colors mode in gnome-terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set colorcolumn=90
