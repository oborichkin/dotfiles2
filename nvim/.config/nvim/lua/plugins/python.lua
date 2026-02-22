-- Python development configuration

return {
  -- Conform.nvim for formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
    keys = {
      -- Format whole file (manual)
      {
        "<leader>mp",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "n",
        desc = "Format Python file",
      },
      -- Format visual selection only
      {
        "<leader>mp",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "v",
        desc = "Format selection",
      },
    },
  },
}
