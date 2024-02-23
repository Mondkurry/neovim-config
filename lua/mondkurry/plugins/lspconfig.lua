return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason").setup({
        ensure_installed = { "clangd", "pyright", "lua_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })

      local default_diagnostic_config = {
        -- signs = {
        --   active = true,
        --   values = {
        --     { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        --     { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        --     { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        --     { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
        --   },
        -- },
        virtual_text = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        }
      }

      vim.diagnostic.config(default_diagnostic_config)
      -- add a keymap to the LSP commands
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}


