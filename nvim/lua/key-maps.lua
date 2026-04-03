local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--接管系统剪切板.
vim.opt.clipboard = "unnamedplus"
