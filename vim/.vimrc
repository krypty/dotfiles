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
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'

Plugin 'flazz/vim-colorschemes'

Plugin 'bling/vim-airline'
set laststatus=2
" enable modified detection
let g:airline_detect_modified=1

Plugin 'airblade/vim-gitgutter'
" always display the gutter, avoid window changing size
let g:gitgutter_sign_column_always=1

" require livedown to be installed. yaourt livedown
Plugin 'shime/vim-livedown'

Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['python', 'bash=sh', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

Plugin 'tpope/vim-sleuth'

Plugin 'Bronson/vim-trailing-whitespace'

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

" custom font on gVim
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
  set guifont=Lucida_Console:h10
  endif
endif

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

" allow switching unsaved files in buffers
set hidden

" ability to toogle search with F3
nnoremap <F3> :set hlsearch!<CR>

" enable mouse
set mouse=a

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" enable 256 colors mode in gnome-terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set colorcolumn=90

" store undo changes across files openings
set undofile
set undodir=~/.vim/.undo//

" do not store backup and swp file into current directory (git friendly)
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" ignore sh/bash error resulting ugly parenthesis highlighting
let g:sh_no_error = 1
