" enable extra features provided by Vim
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" enable syntax highlighting
syntax on

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
