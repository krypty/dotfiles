local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten the function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Make j and k keys go up normally instead of to the previous line number
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Toggle spellcheck
keymap("n", "<F7>", ":setlocal spell! spelllang=en_us<CR>", opts)

-- Close buffer without closing its window
keymap("n", "<leader>q", ":BD<CR>", opts)
keymap("n", "<leader>q!", ":BD!<CR>", opts)

-- Toggle search highlighted matches
keymap("n", "<F3>", ":set hlsearch!<CR>", opts)

-- Open vim's built-in file explorer
keymap("n", "<leader>e", ":Lex 20<CR>", opts)

-- Navigate buffers
keymap("n", "tj", ":bnext<CR>", opts)
keymap("n", "tk", ":bprevious<CR>", opts)
keymap("n", "tl", ":blast<CR>", opts)
keymap("n", "th", ":bfirst<CR>", opts)

-- Resize panes
-- <esc> is somehow the alt key...
keymap("n", "<esc>j", ":resize +5<CR>", opts)
keymap("n", "<esc>k", ":resize -5<CR>", opts)
keymap("n", "<esc>h", ":vertical resize -5<CR>", opts)
keymap("n", "<esc>l", ":vertical resize +5<CR>", opts)

-- Remove trailing spaces
keymap("n", "<leader>rts", ":%s/\\s\\+$//e<CR>", opts)

-- Insert --
-- Press jj fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- Ctrl-Backspace removes last word in insert mode
keymap("i", "<C-H>", "<C-W>", opts)

-- Toggle spellcheck
keymap("i", "<F7>", ":setlocal spell! spelllang=en_us<CR>", opts)



-- Visual --
-- Keep selected text selected when fixing indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-J>", ":m .+1<CR>==", opts)
keymap("v", "<C-K>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)  -- don't replace replaced content in the clipboard



-- Visual Block --
-- Move text up and down
keymap("x", "<C-J>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-K>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", opts)
keymap("n", "tf", ":Telescope buffers<CR>", opts)

-- Nvim-tree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("i", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<F2>", ":NvimTreeFindFileToggle<CR>", opts)
keymap("i", "<F2>", ":NvimTreeFindFileToggle<CR>", opts)
