" be iMproved, required
set nocompatible

"Vundle bootstrap
if !filereadable($HOME . '/.vim/bundle/Vundle.vim/.git/config') && confirm("Clone Vundle?","Y\nn") == 1
  exec '!git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim'
endif

" required by Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map='<c-p>'

Plugin 'flazz/vim-colorschemes'
Plugin 'w0ng/vim-hybrid'

Plugin 'bling/vim-airline'
set laststatus=2
" enable modified detection
let g:airline_detect_modified=1

Plugin 'airblade/vim-gitgutter'
" always display the gutter, avoid window changing size
let g:gitgutter_sign_column_always=1

" --- Markdown
" require some packages, see: https://github.com/suan/vim-instant-markdown
Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_autostart=0

Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['python', 'bash=sh', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" Detect shiftwidth and expandtab automatically
Plugin 'tpope/vim-sleuth'

" Easymotion
Plugin 'easymotion/vim-easymotion'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Loupe (better search defaults)
Plugin 'wincent/loupe'

" JSON
Plugin 'elzr/vim-json'

" Nerdtree
Plugin 'scrooloose/nerdtree'
noremap <leader>o :NERDTreeToggle<cr>

" vim-autoformat
Plugin 'Chiel92/vim-autoformat'
noremap <F4> :Autoformat<CR>

" --- All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" Also required by Vundle
filetype indent plugin on

" enable syntax highlighting
syntax on

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid

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

" Save one keystroke
nnoremap , :

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

" allow switching unsaved files in buffers
set hidden

" ability to toogle search with F3
nnoremap <F3> :set hlsearch!<CR>

" enable mouse
set mouse=a

set t_Co=256

set colorcolumn=90

" store undo changes across files openings
set undofile
set undodir=~/.vim/.undo//

" do not store backup and swp file into current directory (git friendly)
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" ignore sh/bash error resulting ugly parenthesis highlighting
let g:sh_no_error = 1

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" Transparent background
hi Normal ctermbg=none

" Use the system clipboard
set clipboard=unnamed,unnamedplus

" make j and k keys go up normally instead of to the previous line number
nnoremap j gj
nnoremap k gk

" Manage tabs with shorter keymaps
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
