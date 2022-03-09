" be iMproved, required
set nocompatible

"Vundle bootstrap
if !filereadable($HOME . '/.vim/bundle/Vundle.vim/.git/config') && confirm("Clone Vundle?","Y\nn")==1
  exec '!git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim'
endif

" required by Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'sainnhe/gruvbox-material'

Plugin 'lifepillar/vim-mucomplete'
set completeopt+=menuone
set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

Plugin 'vim-scripts/dbext.vim'

Plugin 'martinda/Jenkinsfile-vim-syntax'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

nnoremap tf :Buffers<CR>
nnoremap <C-p> :Files<Cr>
nnoremap <Space>rg :Rg<CR>
" Don't make rg search for filename but only file content, see: https://github.com/junegunn/fzf.vim/issues/346
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg -g '!external/' -g '!.git/**' --hidden --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


" Splits open at the bottom and right
set splitbelow splitright

" <esc> is somehow the alt key...
nnoremap <esc>j :resize +5<CR>
nnoremap <esc>k :resize -5<CR>
nnoremap <esc>h :vertical resize -5<CR>
nnoremap <esc>l :vertical resize +5<CR>


" Spell-check set to <F7> like Word
map <F7> :setlocal spell! spelllang=en_us<CR>

Plugin 'qpkorr/vim-bufkill'
nnoremap <space>q :BD<CR>

" close all buffers except current one
command! BufCurOnly execute '%bdelete|edit#|bdelete#'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
" enable modified detection
let g:airline_detect_modified=1
let g:airline_powerline_fonts=1

let g:airline_theme='gruvbox_material'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#branch#enabled = 0

Plugin 'airblade/vim-gitgutter'
" always display the gutter, avoid window changing size
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always=1
endif

" --- Markdown
" require some packages, see: https://github.com/suan/vim-instant-markdown
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
let g:instant_markdown_autostart=0

Plugin 'tpope/vim-surround'

" Detect shiftwidth and expandtab automatically
Plugin 'tpope/vim-sleuth'

" Easymotion
Plugin 'easymotion/vim-easymotion'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Loupe (better search defaults)
Plugin 'wincent/loupe'

" Highlight the yanked region
Plugin 'machakann/vim-highlightedyank'

" Nerdtree
Plugin 'scrooloose/nerdtree'
noremap <F2> :NERDTreeToggle<cr>
nnoremap <space><F2> :NERDTreeFind<cr>
let NERDTreeShowHidden=1

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

Plugin 'rhysd/vim-clang-format'

Plugin 'mhinz/vim-startify'
let g:startify_custom_header=['']
set viminfo='100,n$HOME/.vim/files/info/viminfo

Plugin 'tpope/vim-markdown'
let g:markdown_syntax_conceal = 0

" Illuminate other uses of the current word under the cursor
Plugin 'RRethy/vim-illuminate'

if has('python3')
  Plugin 'psf/black'
endif

Plugin 'tpope/vim-eunuch'

Plugin 'chrisbra/Colorizer'
nnoremap <Space>cc :ColorToggle<cr>

Plugin 'editorconfig/editorconfig-vim'

Plugin 'lepture/vim-jinja'

Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'

Plugin 'jvirtanen/vim-hcl'

" --- All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" Also required by Vundle
filetype indent plugin on

filetype plugin on

" enable syntax highlighting
syntax on

set encoding=UTF-8

" set leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Save one keystroke
" nnoremap , :

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

set hlsearch

" Keep n lines visibles above/below the cursor
set scrolloff=10

" enable mouse
set mouse=a

set t_Co=256

set colorcolumn=80,100

set list
set listchars=nbsp:·
set listchars+=precedes:«
set listchars+=tab:»·
set listchars+=trail:.
set listchars+=extends:»
" set listchars+=eol:¶

" store undo changes across files openings
set undofile
set undodir=~/.vim/.undo//

" do not store backup and swp file into current directory (git friendly)
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" ignore sh/bash error resulting ugly parenthesis highlighting
let g:sh_no_error=1

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" Use the system clipboard
set clipboard=unnamed,unnamedplus
"
" Don't clear system clipboard on vim exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" make j and k keys go up normally instead of to the previous line number
nnoremap j gj
nnoremap k gk

" Manage buffers with shorter keymaps
nnoremap tk :bprevious<CR>
nnoremap tj :bnext<CR>
nnoremap th :bfirst<CR>
nnoremap tl :blast<CR>

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Esc with jj or ii
:imap jj <Esc>
:imap ii <Esc>

" Move across windows more easily
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Move lines
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv

" Substitute with word-under-cursor pre-writen
" nnoremap S :s/\(<c-r>=expand("<cword>")<cr>\)//g<left><left>
nnoremap S :s/\v
nnoremap <C-s> :%s/\v

" Ctrl-Backspace removes last word in insert mode
inoremap <C-H> <C-W>


" Important!!
if has('termguicolors')
  set termguicolors
endif
" " For dark version.
set background=dark
" For light version.
" set background=light
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_transparent_background = 0

colorscheme gruvbox-material

if has('gui_running')
  au VimEnter * colorscheme gruvbox-material
endif

" Transparent background
" hi Normal ctermbg=none
hi Normal guibg=NONE ctermbg=NONE


" Set color syntax for specific extensions
augroup filetypedetect
  au BufRead,BufNewFile *.ffs set filetype=xml
augroup END

" Cpp specific
autocmd FileType c noremap <Leader>o :FSHere<CR>
autocmd FileType cpp noremap <Leader>o :FSHere<CR>

au FileType c setl sw=2 sts=2 et
au FileType h setl sw=2 sts=2 et
au FileType cpp setl sw=2 sts=2 et
au FileType hpp setl sw=2 sts=2 et

au FileType md setl sw=2 sts=2 et
au FileType markdown setl sw=2 sts=2 et

" Java specific
let java_highlight_functions = 1
let java_highlight_all = 1

highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc
hi javaTypedef term=italic cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=#60ff60 guibg=NONE
