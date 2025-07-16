-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local jenkinsfile_linter = require("jenkinsfile_linter")

vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "groovy" then
      return
    end
    vim.schedule(jenkinsfile_linter.validate)
  end,
 })
