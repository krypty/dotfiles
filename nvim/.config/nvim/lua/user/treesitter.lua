local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

status_ok, ts_rainbow = pcall(require, "ts-rainbow")
if not status_ok then
    return
end

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      -- disable = { 'jsx', 'cpp' },
      -- Which query to use for finding delimiters
      query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      strategy = ts_rainbow.strategy.global,
    },
  context_commentstring = {
    enable = true,
    -- javascript = {
    --   __default = '// %s',
    --   jsx_element = '{/* %s */}',
    --   jsx_fragment = '{/* %s */}',
    --   jsx_attribute = '// %s',
    --   comment = '// %s',
    -- },
  },
}
