-- File tree plugin

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("Neotree close")
        else
          vim.cmd("Neotree focus right")
        end
      end,
      desc = "File tree",
    },
    { "<leader>gs", ":Neotree git_status<CR>", desc = "Git status" },
  },
  config = function()
    local ignore = require("config.ignore")

    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = false,
      default_component_configs = {
        indent = { indent_size = 2 },
        icon = { folder_empty = "󰜌", folder_empty_open = "󰜌" },
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
          ["<esc>"] = "revert_preview",
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = ignore.neo_tree_by_name,
        },
      },
      buffers = { follow_current_file = true },
      git_status = { window = { position = "float" } },
    })
  end,
}
