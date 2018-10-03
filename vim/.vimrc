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

" Color scheme
Plugin 'chriskempson/base16-vim'
" Plugin 'arcticicestudio/nord-vim'
" let g:nord_italic_comments = 1
" augroup nord-overrides
"   autocmd!
"   autocmd ColorScheme nord highlight Comment ctermfg=14
" augroup END

Plugin 'morhetz/gruvbox'
" let g:gruvbox_italic=1
" let g:gruvbox_italicize_strings=0
" let g:gruvbox_italicize_comments=1

Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/](vendor|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" Open CtrlP selection into a new tab instead of a new window
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Show list of opened documents
noremap <C-b> :CtrlPBuffer<CR>


Plugin 'DavidEGx/ctrlp-smarttabs'
nnoremap tf :CtrlPSmartTabs<CR>

Plugin 'mkitt/tabline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
" enable modified detection
let g:airline_detect_modified=1
let g:airline_powerline_fonts = 1

let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Plugin 'airblade/vim-gitgutter'
" always display the gutter, avoid window changing size
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Better python highlighting
Plugin 'hdima/python-syntax'
let python_highlight_all = 1

" --- Markdown
" require some packages, see: https://github.com/suan/vim-instant-markdown
Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_autostart=0

Plugin 'tpope/vim-surround'

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
noremap <F2> :NERDTreeToggle<cr>

" vim-autoformat
Plugin 'Chiel92/vim-autoformat'
noremap <F4> :Autoformat<CR>
autocmd FileType c noremap <F4> :ClangFormat<CR>
autocmd FileType cpp noremap <F4> :ClangFormat<CR>
autocmd FileType python noremap <F4> :Black<CR>

" vim-expand-region
Plugin 'terryma/vim-expand-region'

Plugin 'tomtom/tcomment_vim'

" Extended f, F,t and T key mappings
Plugin 'rhysd/clever-f.vim'

" Range, pattern and substitute preview for Vim
Plugin 'markonm/traces.vim'

" Switch between header and source
Plugin 'derekwyatt/vim-fswitch'
Plugin 'mhinz/vim-startify'
let g:startify_custom_header = ['']

" Illuminate other uses of the current word under the cursor
Plugin 'RRethy/vim-illuminate'

" Should be the last plugin to load
Plugin 'ryanoasis/vim-devicons'

Plugin 'ambv/black'
" --- All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" Also required by Vundle
filetype indent plugin on

" enable syntax highlighting
syntax on

" " custom font on gVim
" if has("gui_running")
"   if has("gui_gtk2")
"     set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"   elseif has("gui_macvim")
"     set guifont=Menlo\ Regular:h14
"   elseif has("gui_win32")
"     set guifont=Lucida_Console:h10
"   endif
" endif

set encoding=UTF-8

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

" Keep n lines visibles above/below the cursor
set scrolloff=10

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

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Esc with jj or ii
:imap jj <Esc>
:imap ii <Esc>


" Move lines
nnoremap <C-S-j> :m .+1<CR>==
nnoremap <C-S-k> :m .-2<CR>==
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv

" Color scheme
set background=dark
" let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme gruvbox
let base16colorspace=256
" set termguicolors

" Set color syntax for specific extensions
augroup filetypedetect
  au BufRead,BufNewFile *.ffs set filetype=xml
augroup END

au FileType markdown setl sw=4 sts=4 et


" Cpp specific
autocmd FileType c noremap <Leader>o :FSHere<CR>
autocmd FileType cpp noremap <Leader>o :FSHere<CR>
