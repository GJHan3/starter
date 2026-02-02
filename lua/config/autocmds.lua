-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 设置窗口分隔符的颜色，使其更加明显
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- 设置垂直分隔线的颜色为黄色
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffaa00", bg = "NONE" })
  end,
})

-- 立即应用当前配色方案的分隔线设置
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffaa00", bg = "NONE" })
