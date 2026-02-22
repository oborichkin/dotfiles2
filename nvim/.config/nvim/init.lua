-- Neovim configuration entry point

-- Load core settings
require("core.options")
require("core.keymaps")

-- Setup lazy.nvim and load plugins
require("bootstrap")

-- Set colorscheme
vim.cmd.colorscheme("tokyonight")
