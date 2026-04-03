-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
-- ~/.config/nvim/lua/config/options.lua
--
local opt = vim.opt

--基础设置

--显示行号
opt.number = true

--启用鼠标
opt.mouse = "c"

--搜索时忽略大小写
opt.ignorecase = true

--智能缩进
opt.smartindent = true

--窗口透明度
opt.winblend = 30
opt.pumblend = 20
vim.g.transparent_enabled = true
opt.termguicolors = true
