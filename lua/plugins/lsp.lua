return {
  -- 配置 LSP 服务器
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Python LSP
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic", -- off, basic, strict
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- openFilesOnly, workspace
              },
            },
          },
        },

        -- C/C++ LSP
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
      },
    },
  },

  -- 配置 Mason 自动安装工具
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP 服务器
        "pyright", -- Python LSP
        "clangd", -- C/C++ LSP

        -- 代码格式化工具
        "black", -- Python formatter
        "isort", -- Python import sorter
        "clang-format", -- C/C++ formatter

        -- 代码检查工具
        "ruff", -- Python linter (fast)
      },
    },
  },
}
