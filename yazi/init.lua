-- ~/.config/yazi/init.lua
-- ⚠️ 以下配置必须严格放在 require("git"):setup() 之前！

-- 初始化 Git 主题配置（避免覆盖已有配置）
th = th or {}
th.git = th.git or {}

-- ===================================================================
-- 🔤 自定义 Git 状态符号（严格使用对钩 ✓ / 叉 ✗ 等简单符号）
-- ===================================================================
th.git.added_sign = "✓" -- 新增文件：对钩（绿色）
th.git.modified_sign = "~" -- 修改文件：波浪线（黄色）
th.git.deleted_sign = "✗" -- 删除文件：叉（红色）
th.git.untracked_sign = "?" -- 未跟踪：问号（蓝色）
th.git.ignored_sign = "!" -- 忽略文件：感叹号（灰色）
th.git.updated_sign = "U" -- 已更新：U（青色）

-- ===================================================================
-- 🎨 自定义 Git 状态样式（严格对应符号，无简化）
-- ===================================================================
th.git.added = ui.Style():fg("green"):bold() -- ✓ 绿色加粗
th.git.modified = ui.Style():fg("yellow"):bold() -- ~ 黄色加粗
th.git.deleted = ui.Style():fg("red"):bold() -- ✗ 红色加粗
th.git.untracked = ui.Style():fg("blue"):italic() -- ? 蓝色斜体
th.git.ignored = ui.Style():fg("dark-gray"):dim() -- ! 暗灰淡化
th.git.updated = ui.Style():fg("cyan"):bold() -- U 青色加粗

require("git"):setup()

require("starship"):setup({
	-- Hide flags (such as filter, find and search). This can be beneficial for starship themes
	-- which are intended to go across the entire width of the terminal.
	hide_flags = false,
	-- Whether to place flags after the starship prompt. False means the flags will be placed before the prompt.
	flags_after_prompt = true,
	-- Custom starship configuration file to use
	config_file = "~/.config/starship_full.toml", -- Default: nil
	-- Whether to enable support for starship's right prompt (i.e. `starship prompt --right`).
	show_right_prompt = false,
	-- Whether to hide the count widget, in case you want only your right prompt to show up. Only has
	-- an effect when `show_right_prompt = true`
	hide_count = false,
	-- Separator to place between the right prompt and the count widget. Use `count_separator = ""`
	-- to have no space between the widgets.
	count_separator = " ",
})

require("yaziline"):setup({
	color = "#98c379", -- main theme color
	secondary_color = "#5A6078", -- secondary color
	default_files_color = "darkgray", -- color of the file counter when it's inactive
	selected_files_color = "white",
	yanked_files_color = "green",
	cut_files_color = "red",

	separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
	separator_open = "",
	separator_close = "",
	separator_open_thin = "",
	separator_close_thin = "",
	separator_head = "",
	separator_tail = "",

	select_symbol = "",
	yank_symbol = "󰆐",

	filename_max_length = 24, -- truncate when filename > 24
	filename_truncate_length = 6, -- leave 6 chars on both sides
	filename_truncate_separator = "...", -- the separator of the truncated filename
})
