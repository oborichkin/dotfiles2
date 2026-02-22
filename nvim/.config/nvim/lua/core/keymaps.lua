-- Keybindings

local keymap = vim.keymap.set

-- Set leader key
vim.g.mapleader = " "

-- Disable space as default mapping
keymap("", "<Space>", "<Nop>", { silent = true })

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", { silent = true })
