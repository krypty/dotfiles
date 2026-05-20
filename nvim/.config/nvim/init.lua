--[[
    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.
--]]

-- ============================================================
-- SECTION 1: FOUNDATION
-- Core Neovim settings, leaders, options, basic keymaps, basic autocmds
-- ============================================================
do
  -- Enable faster startup by caching compiled Lua modules
  vim.loader.enable()

  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Set to true if you have a Nerd Font installed and selected in the terminal
  vim.g.have_nerd_font = true

  -- Sync clipboard between OS and Neovim.
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

  -- [[ Setting options ]]
  --  See `:help vim.o`
  -- NOTE: You can change these options as you wish!
  --  For more options, you can see `:help option-list`

  -- Enable break indent
  vim.o.breakindent = true

  vim.opt.listchars = 'tab:|-,trail:·,multispace:·,extends:▶,precedes:◀,nbsp:‿'
  vim.opt.list = true

  -- Preview substitutions live, as you type!
  vim.o.inccommand = 'split'

  -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
  -- instead raise a dialog asking if you wish to save the current file(s)
  -- See `:help 'confirm'`
  vim.o.confirm = true

  vim.opt.backup = false -- creates a backup file
  --vim.opt.cmdheight = 2  -- more space in the neovim command line for displaying messages
  -- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
  vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
  vim.opt.fileencoding = 'utf-8' -- the encoding written to a file
  vim.opt.hlsearch = true -- highlight all matches on previous search pattern
  vim.opt.ignorecase = true -- ignore case in search pattern
  vim.opt.mouse = 'a' -- allow the mouse to be used in neovim
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
  vim.opt.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each time
  vim.opt.wrap = true -- wrap line if too long
  vim.opt.scrolloff = 10
  vim.opt.sidescrolloff = 10
  -- vim.opt.guifont = "todo"  -- the font used in graphical neovim apps
  vim.opt.showmatch = true -- highlight matching [{()}]
  vim.opt.hidden = true -- allow switching unsaved files in buffers
  vim.opt.colorcolumn = { 80, 100 }
  vim.opt.background = 'light'

  vim.g.autoformat = false

  vim.opt.listchars = 'tab:|-,trail:·,multispace:·,extends:▶,precedes:◀,nbsp:‿'
  vim.opt.list = true

  vim.opt.shortmess:append 'c'

  vim.cmd 'set whichwrap+=<,>,[,],h,l'
  vim.cmd [[set iskeyword+=-]] -- consider kebab-case words as one

  -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
  -- instead raise a dialog asking if you wish to save the current file(s)
  -- See `:help 'confirm'`
  vim.o.confirm = true

  -- [[ Basic Keymaps ]]
  --  See `:help vim.keymap.set()`

  -- Toggle search highlighted matches
  vim.keymap.set('n', '<F3>', ':set invhlsearch<CR>', { noremap = true, silent = true })

  -- Diagnostic keymaps
  vim.keymap.set(
    'n',
    '<leader>dq',
    vim.diagnostic.setloclist,
    { desc = 'Open [D]iagnostic [Q]uickfix list', noremap = true, silent = true }
  )

  -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
  -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
  -- is not what someone will guess without a bit more experience.
  --
  -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
  -- or just use <C-\><C-n> to exit terminal mode
  vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode', noremap = true, silent = true })

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window', noremap = true, silent = true })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window', noremap = true, silent = true })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window', noremap = true, silent = true })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window', noremap = true, silent = true })

  -- Make j and k keys go up normally instead of to the previous line number
  vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
  vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

  -- Toggle spellcheck
  vim.keymap.set('n', '<F7>', ':setlocal spell! spelllang=en_us<CR>', { noremap = true, silent = true })

  -- Close buffer without closing its window
  vim.keymap.set('n', '<leader>q', ':Bdelete<CR>', { desc = '[q]uit buffer', noremap = true, silent = true })

  -- Close all buffers, but the focused one
  vim.keymap.set(
    'n',
    '<leader>Q',
    ':%bd|e#|bd#<CR>',
    { desc = '[Q]uit all but focused buffer', noremap = true, silent = true }
  )

  -- Navigate buffers
  vim.keymap.set('n', 'tj', ':bnext<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'tk', ':bprevious<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'tl', ':blast<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'th', ':bfirst<CR>', { noremap = true, silent = true })

  -- Resize panes
  -- <A> is the alt key...
  vim.keymap.set('n', '<A-j>', ':resize +5<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<A-k>', ':resize -5<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<A-h>', ':vertical resize -5<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<A-l>', ':vertical resize +5<CR>', { noremap = true, silent = true })

  -- Remove trailing spaces
  vim.keymap.set(
    'n',
    '<leader>rts',
    ':%s/\\s\\+$//e<CR>',
    { desc = '[r]emove [t]railing [s]paces', noremap = true, silent = true }
  )

  vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = '[l]azy [g]it', noremap = true, silent = true })

  -- Insert --
  -- Press jj fast to exit insert mode
  vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })

  -- Ctrl-Backspace removes last word in insert mode
  vim.keymap.set('i', '<C-H>', '<C-W>', { noremap = true, silent = true })

  -- Visual --
  -- Keep selected text selected when fixing indentation
  vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
  vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

  -- Move text up and down
  vim.keymap.set('v', '<C-J>', ':m .+1<CR>==', { noremap = true, silent = true })
  vim.keymap.set('v', '<C-K>', ':m .-2<CR>==', { noremap = true, silent = true })
  vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true }) -- don't replace replaced content in the clipboard

  -- Visual Block --
  -- Move text up and down
  vim.keymap.set('x', '<C-J>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
  vim.keymap.set('x', '<C-K>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

  -- Nvim-tree
  vim.keymap.set('n', '<F2>', ':Neotree toggle<CR>', { noremap = true, silent = true })
  vim.keymap.set('i', '<F2>', ':Neotree toggle<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader><F2>', ':Neotree reveal<CR>', { noremap = true, silent = true })
  vim.keymap.set('i', '<leader><F2>', ':Neotree reveal<CR>', { noremap = true, silent = true })

  -- LSP
  vim.keymap.set('n', '<leader>ld', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

  -- Vim's very magic regex
  vim.keymap.set('n', '/', '/\\v', { noremap = true, silent = true })
  vim.keymap.set('c', '%s', '%s/\\v', { noremap = true, silent = true })

  -- Filetype
  -- help: https://neovim.io/doc/user/lua.html#vim.filetype.add%28%29
  vim.filetype.add {
    extension = {
      service = 'systemd',
      timer = 'systemd',
      target = 'systemd',
    },
  }

  -- Diagnostic Config & Keymaps
  --  See `:help vim.diagnostic.Opts`
  vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    signs = vim.g.have_nerd_font and {
      text = {
        [vim.diagnostic.severity.ERROR] = '󰅚 ',
        [vim.diagnostic.severity.WARN] = '󰀪 ',
        [vim.diagnostic.severity.INFO] = '󰋽 ',
        [vim.diagnostic.severity.HINT] = '󰌶 ',
      },
    } or {},

    virtual_text = {
      source = 'if_many',
      spacing = 2,
      format = function(diagnostic)
        local diagnostic_message = {
          [vim.diagnostic.severity.ERROR] = diagnostic.message,
          [vim.diagnostic.severity.WARN] = diagnostic.message,
          [vim.diagnostic.severity.INFO] = diagnostic.message,
          [vim.diagnostic.severity.HINT] = diagnostic.message,
        }
        return diagnostic_message[diagnostic.severity]
      end,
    },

    -- Can switch between these as you prefer
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float {
          bufnr = bufnr,
          scope = 'cursor',
          focus = false,
        }
      end,
    },
  }

  -- [[ Basic Autocommands ]]
  --  See `:help lua-guide-autocommands`

  -- Highlight when yanking (copying) text
  --  Try it with `yap` in normal mode
  --  See `:help vim.hl.on_yank()`
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
  })

  -- toggle behavior: when cursor moves, show virtual_lines only on current line and hide virtual_text for that line
  local ns = vim.api.nvim_create_namespace 'diag_current_line'
  local function show_current_line_virtual_lines()
    vim.diagnostic.config { virtual_text = false }
    -- let the plugin rachartier/tiny-inline-diagnostic.nvim handle the single-line diags
  end

  local function restore_virtual_text()
    -- hide our per-buffer virtual_lines and restore global virtual_text
    pcall(vim.diagnostic.hide, ns, 0)
    vim.diagnostic.config { virtual_text = true }
  end

  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    callback = function()
      -- show wrapped virtual_lines for cursor line if there are diagnostics; else restore text
      local bufnr = vim.api.nvim_get_current_buf()
      local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
      local diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })
      if diagnostics and #diagnostics > 0 then
        show_current_line_virtual_lines()
      else
        restore_virtual_text()
      end
    end,
  })
end

-- ============================================================
-- SECTION 2: PLUGIN MANAGER INTRO
-- vim.pack intro, build hooks
-- ============================================================
do
  -- [[ Intro to `vim.pack` ]]
  -- `vim.pack` is a new plugin manager built into Neovim,
  --  which provides a Lua interface for installing and managing plugins.
  --
  --  See `:help vim.pack`, `:help vim.pack-examples` or the
  --  excellent blog post from the creator of vim.pack and mini.nvim:
  --  https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
  --
  --  To inspect plugin state and pending updates, run
  --    :lua vim.pack.update(nil, { offline = true })
  --
  --  To update plugins, run
  --    :lua vim.pack.update()
  --
  --
  --  Throughout the rest of the config there will be examples
  --  of how to install and configure plugins using `vim.pack`.
  --
  --  In this section we set up some autocommands to run build
  --  steps for certain plugins after they are installed or updated.

  local function run_build(name, cmd, cwd)
    local result = vim.system(cmd, { cwd = cwd }):wait()
    if result.code ~= 0 then
      local stderr = result.stderr or ''
      local stdout = result.stdout or ''
      local output = stderr ~= '' and stderr or stdout
      if output == '' then output = 'No output from build command.' end
      vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
    end
  end

  -- This autocommand runs after a plugin is installed or updated and
  --  runs the appropriate build command for that plugin if necessary.
  --
  -- See `:help vim.pack-events`
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      local name = ev.data.spec.name
      local kind = ev.data.kind
      if kind ~= 'install' and kind ~= 'update' then return end

      if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
        run_build(name, { 'make' }, ev.data.path)
        return
      end

      if name == 'LuaSnip' then
        if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then
          run_build(name, { 'make', 'install_jsregexp' }, ev.data.path)
        end
        return
      end

      if name == 'nvim-treesitter' then
        if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
        vim.cmd 'TSUpdate'
        return
      end
    end,
  })
end

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

-- ============================================================
-- SECTION 3: UI / CORE UX PLUGINS
-- guess-indent, gitsigns, which-key, colorscheme, todo-comments, mini modules
-- ============================================================
do
  -- [[ Installing and Configuring Plugins ]]
  --
  -- To install a plugin simply call `vim.pack.add` with its git url.
  -- This will download the default branch of the plugin, which will usually be `main` or `master`
  -- You can also have more advanced specs, which we will talk about later.
  --
  -- For most plugins its not enough to install them, you also need to call their `.setup()` to start them.
  --
  -- For example, lets say we want to install `guess-indent.nvim` - a plugin for
  -- automatically detecting and setting the indentation.
  --
  -- We first install it from https://github.com/NMAC427/guess-indent.nvim
  -- and then call its `setup()` function to start it with default settings.
  vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
  require('guess-indent').setup {}

  -- Because lua is a real programming language, you can also have some logic to your installation -
  -- like only installing a plugin if a condition is met.
  --
  -- Here we only install `nvim-web-devicons` (which adds pretty icons) if we have a Nerd Font,
  -- since otherwise the icons won't display properly.
  if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

  -- Here is a more advanced configuration example that passes options to `gitsigns.nvim`
  --
  -- See `:help gitsigns` to understand what each configuration key does.
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
  require('gitsigns').setup {
    signs = {
      add = { text = '+' }, ---@diagnostic disable-line: missing-fields
      change = { text = '~' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
    },
  }

  -- Useful plugin to show you pending keybinds.
  vim.pack.add { gh 'folke/which-key.nvim' }
  require('which-key').setup {
    -- Delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
    -- Document existing key chains
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
      { 'gr', group = 'LSP Actions', mode = { 'n' } },
    },
  }

  -- [[ Colorscheme ]]
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command under that to load whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  vim.pack.add { gh 'ellisonleao/gruvbox.nvim' }
  require('gruvbox').setup {
    transparent_mode = false,
  }

  -- Load the colorscheme here.
  -- Like many other themes, this one has different styles, and you could load
  -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  vim.cmd.colorscheme 'gruvbox'

  -- Highlight todo, notes, etc in comments
  vim.pack.add { gh 'folke/todo-comments.nvim' }
  require('todo-comments').setup { signs = false }

  -- [[ mini.nvim ]]
  --  A collection of various small independent plugins/modules
  vim.pack.add { gh 'nvim-mini/mini.nvim' }

  -- Better Around/Inside textobjects
  --
  -- Examples:
  --  - va)  - [V]isually select [A]round [)]paren
  --  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
  --  - ci'  - [C]hange [I]nside [']quote
  require('mini.ai').setup {
    -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
    mappings = {
      around_next = 'aa',
      inside_next = 'ii',
    },
    n_lines = 500,
  }

  -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --
  -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  -- - sd'   - [S]urround [D]elete [']quotes
  -- - sr)'  - [S]urround [R]eplace [)] [']
  require('mini.surround').setup()

  -- Simple and easy statusline.
  --  You could remove this setup call if you don't like it,
  --  and try some other statusline plugin
  local statusline = require 'mini.statusline'
  -- Set `use_icons` to true if you have a Nerd Font
  statusline.setup { use_icons = vim.g.have_nerd_font }

  -- You can configure sections in the statusline by overriding their
  -- default behavior. For example, here we set the section for
  -- cursor location to LINE:COLUMN
  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function() return '%2l:%-2v' end

  -- ... and there is more!
  --  Check out: https://github.com/nvim-mini/mini.nvim
end

-- ============================================================
-- SECTION 4: SEARCH & NAVIGATION
-- Telescope setup, keymaps, LSP picker mappings
-- ============================================================
do
  -- [[ Fuzzy Finder (files, lsp, etc) ]]
  --
  -- Telescope is a fuzzy finder that comes with a lot of different things that
  -- it can fuzzy find! It's more than just a "file finder", it can search
  -- many different aspects of Neovim, your workspace, LSP, and more!
  --
  -- There are lots of other alternative pickers (like snacks.picker, or fzf-lua)
  -- so feel free to experiment and see what you like!
  --
  -- The easiest way to use Telescope, is to start by doing something like:
  --  :Telescope help_tags
  --
  -- After running this command, a window will open up and you're able to
  -- type in the prompt window. You'll see a list of `help_tags` options and
  -- a corresponding preview of the help.
  --
  -- Two important keymaps to use while in Telescope are:
  --  - Insert mode: <c-/>
  --  - Normal mode: ?
  --
  -- This opens a window that shows you all of the keymaps for the current
  -- Telescope picker. This is really useful to discover what Telescope can
  -- do as well as how to actually do it!

  ---@type (string|vim.pack.Spec)[]
  local telescope_plugins = {
    gh 'nvim-lua/plenary.nvim',
    gh 'nvim-telescope/telescope.nvim',
    gh 'nvim-telescope/telescope-ui-select.nvim',
  }
  if vim.fn.executable 'make' == 1 then
    table.insert(telescope_plugins, gh 'nvim-telescope/telescope-fzf-native.nvim')
  end

  -- NOTE: You can install multiple plugins at once
  vim.pack.add(telescope_plugins)

  -- See `:help telescope` and `:help telescope.setup()`
  require('telescope').setup {
    -- You can put your default mappings / updates / etc. in here
    --  All the info you're looking for is in `:help telescope.setup()`
    --
    -- defaults = {
    --   mappings = {
    --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
    --   },
    -- },
    -- pickers = {}
    extensions = {
      ['ui-select'] = { require('telescope.themes').get_dropdown() },
    },
  }

  -- Enable Telescope extensions if they are installed
  pcall(require('telescope').load_extension, 'fzf')
  pcall(require('telescope').load_extension, 'ui-select')

  -- See `:help telescope.builtin`
  local builtin = require 'telescope.builtin'
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'search files' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = 'search by grep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
  vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>', { desc = '[s]earch [t]odo' })
  vim.keymap.set('n', 'tf', builtin.buffers, { desc = '[ ] Find existing buffers' })

  -- Add Telescope-based LSP pickers when an LSP attaches to a buffer.
  -- If you later switch picker plugins, this is where to update these mappings.
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
    callback = function(event)
      local buf = event.buf

      -- Find references for the word under your cursor.
      vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })

      -- Jump to the implementation of the word under your cursor.
      -- Useful when your language has ways of declaring types without an actual implementation.
      vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })

      -- Jump to the definition of the word under your cursor.
      -- This is where a variable was first declared, or where a function is defined, etc.
      -- To jump back, press <C-t>.
      vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })

      -- Fuzzy find all the symbols in your current document.
      -- Symbols are things like variables, functions, types, etc.
      vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })

      -- Fuzzy find all the symbols in your current workspace.
      -- Similar to document symbols, except searches over your entire project.
      vim.keymap.set(
        'n',
        'gW',
        builtin.lsp_dynamic_workspace_symbols,
        { buffer = buf, desc = 'Open Workspace Symbols' }
      )

      -- Jump to the type of the word under your cursor.
      -- Useful when you're not sure what type a variable is and you want to see
      -- the definition of its *type*, not where it was *defined*.
      vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
    end,
  })

  -- Override default behavior and theme when searching
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  -- It's also possible to pass additional configuration options.
  --  See `:help telescope.builtin.live_grep()` for information about particular keys
  vim.keymap.set(
    'n',
    '<leader>s/',
    function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end,
    { desc = '[S]earch [/] in Open Files' }
  )

  -- Shortcut for searching your Neovim configuration files
  vim.keymap.set(
    'n',
    '<leader>sn',
    function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end,
    { desc = '[S]earch [N]eovim files' }
  )
end

-- ============================================================
-- SECTION 5: LSP
-- LSP keymaps, server configuration, Mason tools installations
-- ============================================================
do
  -- [[ LSP Configuration ]]
  -- Brief aside: **What is LSP?**
  --
  -- LSP is an initialism you've probably heard, but might not understand what it is.
  --
  -- LSP stands for Language Server Protocol. It's a protocol that helps editors
  -- and language tooling communicate in a standardized fashion.
  --
  -- In general, you have a "server" which is some tool built to understand a particular
  -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
  -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
  -- processes that communicate with some "client" - in this case, Neovim!
  --
  -- LSP provides Neovim with features like:
  --  - Go to definition
  --  - Find references
  --  - Autocompletion
  --  - Symbol Search
  --  - and more!
  --
  -- Thus, Language Servers are external tools that must be installed separately from
  -- Neovim. This is where `mason` and related plugins come into play.
  --
  -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
  -- and elegantly composed help section, `:help lsp-vs-treesitter`

  -- Useful status updates for LSP.
  vim.pack.add { gh 'j-hui/fidget.nvim' }
  require('fidget').setup {}

  --  This function gets run when an LSP attaches to a particular buffer.
  --    That is to say, every time a new file is opened that is associated with
  --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
  --    function will be executed to configure the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
      -- NOTE: Remember that Lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
      end

      -- Rename the variable under your cursor.
      --  Most Language Servers support renaming across files, etc.
      map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate.
      map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

      -- TODO: add gd to go to definition?

      -- WARN: This is not Goto Definition, this is Goto Declaration.
      --  For example, in C this would take you to the header.
      map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

      -- The following two autocommands are used to highlight references of the
      -- word under your cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client:supports_method('textDocument/documentHighlight', event.buf) then
        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          end,
        })
      end

      -- The following code creates a keymap to toggle inlay hints in your
      -- code, if the language server you are using supports them
      --
      -- This may be unwanted, since they displace some of your code
      if client and client:supports_method('textDocument/inlayHint', event.buf) then
        map(
          '<leader>th',
          function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end,
          '[T]oggle Inlay [H]ints'
        )
      end
    end,
  })

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --  See `:help lsp-config` for information about keys and how to configure
  ---@type table<string, vim.lsp.Config>
  local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`ts_ls`) will work just fine
    -- ts_ls = {},

    stylua = {}, -- Used to format Lua code

    -- Special Lua Config, as recommended by neovim help docs
    lua_ls = {
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath 'config'
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
            path = { 'lua/?.lua', 'lua/?/init.lua' },
          },
          workspace = {
            checkThirdParty = false,
            -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
            --  See https://github.com/neovim/nvim-lspconfig/issues/3189
            library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
              '${3rd}/luv/library',
              '${3rd}/busted/library',
            }),
          },
        })
      end,
      ---@type lspconfig.settings.lua_ls
      settings = {
        Lua = {
          format = { enable = false }, -- Disable formatting (formatting is done by stylua)
        },
      },
    },
  }

  vim.pack.add {
    gh 'neovim/nvim-lspconfig',
    gh 'mason-org/mason.nvim',
    gh 'mason-org/mason-lspconfig.nvim',
    gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
  }

  -- Automatically install LSPs and related tools to stdpath for Neovim
  require('mason').setup {}

  -- Ensure the servers and tools above are installed
  --
  -- To check the current status of installed tools and/or manually install
  -- other tools, you can run
  --    :Mason
  --
  -- You can press `g?` for help in this menu.
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    -- You can add other tools here that you want Mason to install
    'pyrefly',
    'lua-language-server',
    'ruff',
    'stylua', -- Used to format Lua code
    'bash-language-server',
    'ansible-language-server',
    'ansible-lint',
    'checkmake',
    'clang-format',
    'clangd',
    'cmake-language-server',
    'docformatter',
    'docker-language-server',
    'robotframework-lsp',
    'shellcheck',
    'shfmt',
    'yamllint',
    'biome',
    'systemd-lsp',
    'mbake',
    'tombi',
  })

  require('mason-tool-installer').setup { ensure_installed = ensure_installed }
  require('mason-lspconfig').setup { automatic_enable = true }

  for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
  end
end

-- ============================================================
-- SECTION 6: FORMATTING
-- conform.nvim setup and keymap
-- ============================================================
do
  -- [[ Formatting ]]
  vim.pack.add { gh 'stevearc/conform.nvim' }
  require('conform').setup {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- You can specify filetypes to autoformat on save here:
      local enabled_filetypes = {
        -- lua = true,
        -- python = true,
      }
      if enabled_filetypes[vim.bo[bufnr].filetype] then
        return { timeout_ms = 500 }
      else
        return nil
      end
    end,
    default_format_opts = {
      lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
    },
    -- You can also specify external formatters in here.
    formatters_by_ft = {
      -- Conform can also run multiple formatters sequentially (separate by commas)
      java = { 'google-java-format' },
      sh = { 'shfmt' },
      sql = { 'pg_format' },
      python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
      jsonc = { 'biome' },
      json = { 'biome' },
      lua = { 'stylua' },
      make = { 'bake' },
      toml = { 'tombi' },
      robot = { 'robot' },
    },
  }

  vim.keymap.set(
    { 'n', 'v' },
    '<F4>',
    function() require('conform').format { async = true } end,
    { desc = '[F4]ormat buffer' }
  )
end

local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then table.insert(unused_plugins, plugin.spec.name) end
  end

  if #unused_plugins == 0 then
    print 'No unused plugins.'
    return
  end

  local choice = vim.fn.confirm('Remove unused plugins?', '&Yes\n&No', 2)
  if choice == 1 then vim.pack.del(unused_plugins) end
end

vim.keymap.set('n', '<leader>pc', pack_clean, { desc = '[P]ack [C]lean' })

-- ============================================================
-- SECTION 7: AUTOCOMPLETE & SNIPPETS
-- blink.cmp and luasnip setup
-- ============================================================
do
  -- [[ Snippet Engine ]]

  -- NOTE: You can also specify plugin using a version range for its git tag.
  --  See `:help vim.version.range()` for more info
  vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
  require('luasnip').setup {}

  -- `friendly-snippets` contains a variety of premade snippets.
  --    See the README about individual language/framework/plugin snippets:
  --    https://github.com/rafamadriz/friendly-snippets
  --
  -- vim.pack.add { gh 'rafamadriz/friendly-snippets' }
  -- require('luasnip.loaders.from_vscode').lazy_load()

  -- [[ Autocomplete Engine ]]
  vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
  require('blink.cmp').setup {
    keymap = {
      -- 'default' (recommended) for mappings similar to built-in completions
      --   <c-y> to accept ([y]es) the completion.
      --    This will auto-import if your LSP supports it.
      --    This will expand snippets if the LSP sent a snippet.
      -- 'super-tab' for tab to accept
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- For an understanding of why the 'default' preset is recommended,
      -- you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      --
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      --
      -- See `:help blink-cmp-config-keymap` for defining your own keymap
      preset = 'enter',

      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    snippets = { preset = 'luasnip' },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See `:help blink-cmp-config-fuzzy` for more information
    fuzzy = { implementation = 'lua' },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  }
end

-- ============================================================
-- SECTION 8: TREESITTER
-- Parser installation, syntax highlighting, folds, indentation
-- ============================================================
do
  -- [[ Configure Treesitter ]]
  --  Used to highlight, edit, and navigate code
  --
  --  See `:help nvim-treesitter-intro`

  -- NOTE: You can also specify a branch or a specific commit
  vim.pack.add { { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' } }

  -- Ensure basic parsers are installed
  local parsers =
    { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
  require('nvim-treesitter').install(parsers)

  ---@param buf integer
  ---@param language string
  local function treesitter_try_attach(buf, language)
    -- Check if a parser exists and load it
    if not vim.treesitter.language.add(language) then return end
    -- Enable syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- Enable treesitter based folds
    -- For more info on folds see `:help folds`
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'

    -- Check if treesitter indentation is available for this language, and if so enable it
    -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
    local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

    -- Enable treesitter based indentation
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
  end

  local available_parsers = require('nvim-treesitter').get_available()
  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local buf, filetype = args.buf, args.match

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then return end

      local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

      if vim.tbl_contains(installed_parsers, language) then
        -- Enable the parser if it is already installed
        treesitter_try_attach(buf, language)
      elseif vim.tbl_contains(available_parsers, language) then
        -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
        require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
      else
        -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
        treesitter_try_attach(buf, language)
      end
    end,
  })
end

-- ============================================================
-- SECTION 9: OPTIONAL EXAMPLES / NEXT STEPS
-- kickstart.plugins.* examples
-- ============================================================
do
  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug'
  -- require 'kickstart.plugins.indent_line'
  -- require 'kickstart.plugins.lint'
  -- require 'kickstart.plugins.autopairs'
  -- require 'kickstart.plugins.neo-tree'
  require 'kickstart.plugins.gitsigns' -- adds gitsigns recommended keymaps

  -- NOTE: You can add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- require 'custom.plugins'

  vim.pack.add {
    -- Simple plugins
    'https://github.com/Morozzzko/git_browse.nvim',
    'https://github.com/seeamkhan/robotframework-vim',
    'https://github.com/tpope/vim-eunuch',
    'https://github.com/gpanders/editorconfig.nvim',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/ray-x/go.nvim',
    'https://github.com/moll/vim-bbye',

    -- Dependencies
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/echasnovski/mini.icons',
    'https://github.com/delphinus/budoux.lua',

    -- Main plugins
    'https://github.com/nvim-neo-tree/neo-tree.nvim',
    'https://github.com/ten3roberts/window-picker.nvim',
    'https://github.com/kdheepak/lazygit.nvim',
    'https://github.com/ckipp01/nvim-jenkinsfile-linter',
    'https://github.com/goolord/alpha-nvim',
    'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/delphinus/md-render.nvim',
  }

  -- ============================================================================
  -- bufferline.nvim
  -- ============================================================================

  vim.pack.add {
    'https://github.com/akinsho/bufferline.nvim',
  }

  require('bufferline').setup {
    options = {

      -- don't show quickfix buffers in bufferline
      custom_filter = function(buf_number, _) return vim.bo[buf_number].filetype ~= 'qf' end,
    },
  }

  -- ============================================================================
  -- vim-fswitch
  -- Lazy-load equivalent for BufEnter *.cpp
  -- ============================================================================

  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.cpp',
    once = true,
    callback = function() vim.cmd 'packadd vim-fswitch' end,
  })

  -- NOTE:
  -- With vim.pack, if you want true lazy loading,
  -- you usually install/start plugins as opt packages
  -- and then :packadd them manually.
  --
  -- Depending on your vim.pack layout/setup,
  -- you may instead just keep vim-fswitch always loaded.

  -- ============================================================================
  -- neo-tree
  -- ============================================================================

  do
    local picker = require 'window-picker'

    picker.setup()

    picker.pick_window = function()
      return picker.select({ hl = 'WindowPicker', prompt = 'Pick window: ' }, function(winid)
        if not winid then return nil end
        return winid
      end)
    end

    local function git_root(filepath)
      local repo_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
      return vim.fs.relpath(repo_root, filepath)
    end

    require('neo-tree').setup {
      window = {
        mappings = {
          ['Y'] = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local results = {
              filepath,
              git_root(filepath),
              modify(filepath, ':.'),
              modify(filepath, ':~'),
              filename,
              modify(filename, ':r'),
              modify(filename, ':e'),
            }

            vim.ui.select({
              '1. Absolute path: ' .. results[1],
              '2. Git path: ' .. results[2],
              '3. Path relative to CWD: ' .. results[3],
              '4. Path relative to HOME: ' .. results[4],
              '5. Filename: ' .. results[5],
              '6. Filename without extension: ' .. results[6],
              '7. Extension of the filename: ' .. results[7],
            }, {
              prompt = 'Choose to copy to clipboard:',
            }, function(choice)
              if not choice then return end

              local i = tonumber(choice:sub(1, 1))
              local result = results[i]

              vim.fn.setreg('+', result)
              vim.notify('Copied: ' .. result)
            end)
          end,
        },
      },

      filesystem = {
        bind_to_cwd = true,

        filtered_items = {
          visible = true,

          never_show = {
            '.DS_Store',
            'thumbs.db',
            '__pycache__',
          },

          never_show_by_pattern = {
            '.null-ls_*',
            '*.pyc',
          },
        },

        follow_current_file = {
          enabled = false,
          leave_dirs_open = true,
        },
      },

      buffers = {
        follow_current_file = {
          enabled = false,
          leave_dirs_open = true,
        },
      },
    }
  end

  -- ============================================================================
  -- Jenkinsfile linter
  -- ============================================================================

  do
    local jenkinsfile_linter = require 'jenkinsfile_linter'

    vim.api.nvim_create_autocmd({
      'BufWritePost',
      'BufWinEnter',
    }, {
      pattern = 'Jenkinsfile',
      callback = function()
        if vim.bo.filetype ~= 'groovy' then return end

        vim.schedule(jenkinsfile_linter.validate)
      end,
    })
  end

  -- ============================================================================
  -- alpha-nvim
  -- ============================================================================

  require('alpha').setup(require('alpha.themes.startify').config)

  -- ============================================================================
  -- tiny-inline-diagnostic
  -- ============================================================================

  require('tiny-inline-diagnostic').setup {
    priority = 1000,
  }

  -- If you only want this on VeryLazy equivalent:
  vim.schedule(function() require('tiny-inline-diagnostic').enable() end)

  -- ============================================================================
  -- nvim-highlight-colors
  -- ============================================================================

  require('nvim-highlight-colors').setup {}

  -- ============================================================================
  -- md-render
  -- ============================================================================

  vim.keymap.set('n', '<leader>mP', '<Plug>(md-render-preview)', { desc = 'Markdown preview (toggle)' })

  vim.keymap.set('n', '<leader>mt', '<Plug>(md-render-preview-tab)', { desc = 'Markdown preview in tab (toggle)' })

  vim.keymap.set('n', '<leader>md', '<Plug>(md-render-demo)', { desc = 'Markdown render demo' })

  -- ============================================================================
  -- gitsigns.nvim
  -- ============================================================================

  vim.pack.add {
    'https://github.com/lewis6991/gitsigns.nvim',
  }

  require('gitsigns').setup {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },

    signs_staged = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
    },
  }
end
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
