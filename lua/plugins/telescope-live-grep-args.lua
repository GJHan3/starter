return {
  -- 添加 telescope-live-grep-args 依赖
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "^1.0.0",
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },

  -- 扩展 telescope 配置
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      -- 自定义 action：发送到 quickfix 然后打开 Trouble
      local function send_to_trouble(prompt_bufnr)
        actions.send_to_qflist(prompt_bufnr)
        vim.cmd("Trouble qflist open")
      end

      -- 合并到默认 mappings（与 LazyVim 的方式一致）
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<C-q>"] = send_to_trouble,
          },
          n = {
            ["<C-q>"] = send_to_trouble,
          },
        },
      })

      -- 配置 live_grep_args 扩展
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
      })

      return opts
    end,
    keys = {
      -- 覆盖默认的 <leader>sg，使用 live_grep_args
      {
        "<leader>sg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep with Args (Root Dir)",
      },
      -- 添加 cwd 版本
      {
        "<leader>sG",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args({ cwd = vim.uv.cwd() })
        end,
        desc = "Grep with Args (cwd)",
      },
    },
  },
}
