return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    -- 终端配置
    split_side = "right", -- Claude 终端在右侧
    split_width_percentage = 0.40, -- 占 40% 宽度（优化 tmux 环境显示）
    auto_start = true, -- 自动启动 WebSocket 服务器
    provider = "snacks", -- 使用 snacks 终端

    -- 工作目录配置
    git_repo_cwd = true, -- 自动定位到 git 仓库根目录

    -- Diff 配置
    auto_close_on_accept = true, -- 接受修改后自动关闭 diff
    vertical_split = true, -- 垂直分割显示 diff

    -- Claude CLI 路径（使用 ept claude）
    terminal_cmd = "ept claude",

    -- 日志级别（调试时可以改成 "debug"）
    log_level = "info",
  },

  -- 快捷键配置
  keys = {
    -- 打开/关闭 Claude 终端
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },

    -- 聚焦到 Claude 终端
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },

    -- 发送选区到 Claude（visual 模式）
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send Selection to Claude" },

    -- 添加当前文件到 Claude 上下文
    { "<leader>aa", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add Current File to Claude" },

    -- Diff 操作
    { "<leader>aD", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude Changes" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude Changes" },
  },
}
