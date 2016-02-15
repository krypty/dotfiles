syntax on
set number
set tabstop=4     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " tabs are spaces
set showcmd       " show command in bottom bar
set cursorline    " highlight current line
set lazyredraw    " redraw only when we need to.
set showmatch     " highlight matching [{()}]
set incsearch     " search as characters are entered
set hlsearch      " highlight matches
set mouse=a

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

