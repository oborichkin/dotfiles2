-- Startup dashboard plugin

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  enabled = not vim.g.vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local builtin = require("telescope.builtin")

    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
          [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
          [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
          [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
          [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
          [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          [[]],
        },
        center = {
          {
            action = builtin.find_files,
            desc = " Find file",
            icon = " ",
            key = "o",
          },
          {
            action = function()
              vim.cmd("ene | startinsert")
            end,
            desc = " New file",
            icon = " ",
            key = "n",
          },
          {
            action = builtin.oldfiles,
            desc = " Recent files",
            icon = " ",
            key = "r",
          },
          {
            action = builtin.live_grep,
            desc = " Find text",
            icon = " ",
            key = "g",
          },
          {
            action = function()
              vim.cmd("qa")
            end,
            desc = " Quit",
            icon = " ",
            key = "q",
          },
        },
        footer = {
          "",
          "",
        },
      },
    })
  end,
}
