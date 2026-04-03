return {
  "folke/snacks.nvim",
  opts = {
    -- 保留基础功能，仅禁用冲突部分
    explorer = {
      enabled = false, -- ⭐ 关键：禁用文件浏览器（Yazi 冲突源）
      diagnostics = false, -- 禁用诊断（防崩溃）
    },
    -- 其他功能保持默认
  },
}
