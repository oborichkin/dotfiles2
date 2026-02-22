-- Auto save plugin

return {
  "pocco81/auto-save.nvim",
  enabled = not vim.g.vscode,
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      write_all_buffers = false,
      debounce_delay = 135,
    })
  end,
}
