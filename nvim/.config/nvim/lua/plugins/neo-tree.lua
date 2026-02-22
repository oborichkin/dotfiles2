-- File tree plugin

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", ":Neotree toggle right<CR>", desc = "File tree" },
    { "<leader>bf", ":Neotree buffers<CR>", desc = "Buffers" },
    { "<leader>gf", ":Neotree git_status<CR>", desc = "Git status" },
  },
  config = function()
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
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
      buffers = { follow_current_file = true },
      git_status = { window = { position = "float" } },
    })
  end,
}
