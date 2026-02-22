-- LSP server manager plugin

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup({
      ui = { border = "rounded" },
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
    })

    -- LSP configuration
    local lspconfig = require("lspconfig")

    -- Lua LS setup for Neovim Lua development
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            enable = true,
            globals = { "vim" },
            disable = { "missing-fields" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("~/.config/nvim/lua")] = true,
            },
            maxPreload = 2000,
            preloadFileSize = 1000,
          },
          telemetry = { enable = false },
          hint = { enable = true },
        },
      },
    })

    -- Common LSP keymaps (buffer-local)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("gi", vim.lsp.buf.implementation, "Go to implementation")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("gr", vim.lsp.buf.references, "References")
        map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
        map("]d", vim.diagnostic.goto_next, "Next diagnostic")
      end,
    })

    -- Diagnostic configuration
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
