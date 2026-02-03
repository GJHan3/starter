-- 方案选择：
-- 方案 1：使用 barbecue.nvim（功能丰富，显示面包屑导航 + LSP 符号）
-- 方案 2：使用简单内置方案（轻量级，只显示文件路径）

-- 当前使用：方案 2（简单版）
-- 如果想用方案 1，注释掉方案 2 的 return，取消注释方案 1

-- ============ 方案 2：简单内置 winbar（当前使用）============
return {
  {
    "LazyVim/LazyVim",
    init = function()
      -- 设置 winbar 显示文件路径
      vim.opt.winbar = "%{%v:lua.require'plugins.winbar-simple'.winbar()%}"
    end,
  },
}

-- ============ 方案 1：barbecue.nvim（功能丰富版）============
--[[
return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- 显示设置
      show_dirname = true, -- 显示目录名
      show_basename = true, -- 显示文件名
      show_modified = true, -- 显示修改状态

      -- 自定义符号
      symbols = {
        modified = "●",
        ellipsis = "…",
        separator = "",
      },

      -- 排除的文件类型
      exclude_filetypes = {
        "netrw",
        "toggleterm",
        "neo-tree",
        "trouble",
        "qf",
        "help",
        "terminal",
        "lazy",
        "mason",
      },

      -- 主题
      theme = "auto", -- 自动适配配色方案
    },
  },
}
]]
