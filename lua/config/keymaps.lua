-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 快速聚焦到 Trouble 窗口
vim.keymap.set("n", "<leader>xf", function()
  -- 查找 Trouble 窗口并聚焦
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local filetype = vim.bo[buf].filetype
    if filetype == "trouble" then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
  -- 如果没有打开的 Trouble 窗口，提示用户
  vim.notify("No Trouble window found", vim.log.levels.WARN)
end, { desc = "Focus Trouble Window" })

-- 智能窗口分割：避免在特殊窗口（Trouble、NeoTree 等）中分割
local function smart_split(split_cmd)
  return function()
    local filetype = vim.bo.filetype
    local special_filetypes = { "trouble", "neo-tree", "qf", "help", "terminal" }

    -- 如果在特殊窗口，先跳转到主编辑窗口
    if vim.tbl_contains(special_filetypes, filetype) then
      -- 查找第一个普通编辑窗口
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.bo[buf].filetype
        if not vim.tbl_contains(special_filetypes, ft) and vim.bo[buf].buftype == "" then
          vim.api.nvim_set_current_win(win)
          break
        end
      end
    end
    -- 执行分割命令
    vim.cmd(split_cmd)
  end
end

-- 覆盖默认的分割命令
vim.keymap.set("n", "<C-w>v", smart_split("vsplit"), { desc = "Smart Vertical Split" })
vim.keymap.set("n", "<C-w>s", smart_split("split"), { desc = "Smart Horizontal Split" })

