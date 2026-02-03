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

-- 设置 winbar 显示文件名
vim.opt.winbar = "%{%v:lua.require'utils.winbar'.winbar()%}"

-- 在 Trouble 窗口中设置智能跳转
vim.api.nvim_create_autocmd("FileType", {
  pattern = "trouble",
  callback = function(event)
    vim.keymap.set("n", "<cr>", function()
      -- 保存当前 trouble 窗口
      local trouble_win = vim.api.nvim_get_current_win()

      -- 查找最近使用的编辑窗口
      local special_fts = { "trouble", "neo-tree", "qf", "help", "terminal" }
      local target_win = nil

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if win ~= trouble_win then
          local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
          if ok then
            local ft = vim.bo[buf].filetype or ""
            local bt = vim.bo[buf].buftype or ""

            if not vim.tbl_contains(special_fts, ft) and bt == "" then
              target_win = win
              break
            end
          end
        end
      end

      -- 切换到目标窗口
      if target_win then
        vim.api.nvim_set_current_win(target_win)
      end

      -- 执行 Trouble 的跳转
      require("trouble").jump()
    end, { buffer = event.buf, desc = "Jump to item in last used window" })
  end,
})
