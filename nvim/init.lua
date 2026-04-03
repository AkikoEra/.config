-- bootstrap lazy.nvim, LazyVim and your plugins
--Lazyvim管理
require("config.lazy")
--MarkdownPreview浏览器配置
vim.g.mkdp_browser = "/usr/bin/firefox"

--基础使用习惯配置
require("config.options")

--按键映射
require("key-maps")

--加载自动命令配置
require("config.autocmds")

require("config.render-markdown")

vim.cmd("colorscheme catppuccin")
