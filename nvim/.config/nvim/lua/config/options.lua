-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allow neovim to access the system clipboard
--vim.opt.cmdheight = 2  -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search pattern
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in ms)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not....
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indendation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = true -- wrap line if too long
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
-- vim.opt.guifont = "todo"  -- the font used in graphical neovim apps
vim.opt.showmatch = true -- highlight matching [{()}]
vim.opt.hidden = true -- allow switching unsaved files in buffers
vim.opt.colorcolumn = { 80, 100 }
vim.opt.background = "light"

vim.g.autoformat = false

-- vim.opt.list = true
-- vim.opt.listchars = "nbsp:·"
-- vim.opt.listchars:append "precedes:«"
-- vim.opt.listchars:append "tab:»·"
-- vim.opt.listchars:append "trail:."
-- vim.opt.listchars:append "extends:»"
-- --vim.opt.listchars:append "eol:¶"

vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]]) -- consider kebab-case words as one
