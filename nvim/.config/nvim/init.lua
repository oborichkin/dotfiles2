-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load core settings
require("core.options")
require("core.keymaps")

-- Setup lazy.nvim and load plugins
require("bootstrap")

-- Handle directory argument like VS Code (cd into dir, open dashboard)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if vim.fn.isdirectory(arg) == 1 then
      vim.cmd.cd(arg)
      -- Delete the empty buffer and open dashboard
      vim.api.nvim_buf_delete(0, { force = true })
      vim.defer_fn(function()
        vim.cmd("Dashboard")
      end, 100)
    end
  end,
})

-- Set colorscheme
vim.cmd.colorscheme("tokyonight")
