-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Force use of OSC 52 for clipboard (SSH remote support)
-- This allows copying to system clipboard from inside nvim over SSH
local function paste()
  return {
    vim.fn.split(vim.fn.getreg('"'), "\n"),
    vim.fn.getregtype('"'),
  }
end

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = paste,
    ['*'] = paste,
  },
}

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See :help 'clipboard'
vim.opt.clipboard = "unnamedplus"