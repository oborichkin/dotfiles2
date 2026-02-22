-- Fuzzy finder plugin

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>p", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>f", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    { "<leader>b", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
  },
  config = function()
    local ignore = require("config.ignore")

    require("telescope").setup({
      defaults = {
        hidden = true,
        file_ignore_patterns = ignore.telescope,
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
        live_grep = {
          hidden = true,
          no_ignore = true,
        },
      },
    })
  end,
}
