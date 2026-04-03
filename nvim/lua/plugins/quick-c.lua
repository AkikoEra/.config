return {
  "AuroBreeze/quick-c",

  lazy = true,
  event = "VeryLazy",

  -- 1) 文件类型触发（打开 C/C++ 文件时加载）
  ft = { "c", "cpp" },
  -- 2) 快捷键触发（首次按键时加载，映射由插件在 setup 时注入）
  keys = {
    { "<leader>cqb", desc = "Quick-c: Build" },
    { "<leader>cqr", desc = "Quick-c: Run" },
    { "<leader>cqR", desc = "Quick-c: Build & Run" },
    { "<leader>cqD", desc = "Quick-c: Debug" },
    { "<leader>cqM", desc = "Quick-c: Make targets (Telescope)" },
    { "<leader>cqS", desc = "Quick-c: Select sources (Telescope)" }, -- 使用tab进行多选
    { "<leader>cqf", desc = "Quick-c: Open quickfix (Telescope)" },
    { "<leader>cqL", desc = "Quick-c: Build logs (Telescope)" },
    { "<leader>cqC", desc = "Quick-c: CMake targets (Telescope)" },
    { "<leader>cqB", desc = "Quick-c: CMake build" },
    { "<leader>cqc", desc = "Quick-c: CMake configure" },
    { "<leader>cqx", desc = "Quick-c: Stop current task" },
    { "<leader>cqt", desc = "Quick-c: Retry last task" },
  },
  -- 3) 命令触发（调用命令时加载，等同“命令提前加载”）
  cmd = {
    "QuickCBuild",
    "QuickCRun",
    "QuickCBR",
    "QuickCDebug",
    "QuickCMake",
    "QuickCMakeRun",
    "QuickCMakeCmd",
    "QuickCCMake",
    "QuickCCMakeRun",
    "QuickCCMakeConfigure",
    "QuickCCompileDB",
    "QuickCCompileDBGen",
    "QuickCCompileDBUse",
    "QuickCQuickfix",
    "QuickCCheck",
  },
  config = function()
    require("quick-c").setup({
      compile = {
        prefer = { c = nil, cpp = nil },
        prefer_force = false,
        -- 用户自定义编译命令：可通过模板或预设完全覆盖内置命令
        -- 当 enabled = true 时，构建流程会优先询问/选择自定义命令；未选择时回退到内置命令
        user_cmd = {
          enabled = true,
          -- 是否使用 Telescope 弹窗选择：包含 [Use built-in]、[Custom input...] 以及 presets
          telescope = {
            popup = false, -- 参考 make 的交互，默认不弹；开启后若未安装 telescope 将自动回退到 vim.ui
            prompt_title = "Quick-c Compile",
          },
          -- 预设命令（推荐使用列表形式以避免 shell 解析问题）：
          -- 必须使用完整的编译命令，这不是追加参数
          -- 允许占位符：{sources} {out} {cc} {ft}
          -- 例如：{ 'gcc', '-g', '-O0', '{sources}', '-o', '{out}' }
          presets = {},
          -- 自定义输入的默认模板（字符串或数组）。
          -- 这是弹窗后的追加命令
          default = nil,
          -- 记住每个项目最近一次输入（用于下次默认值）
          remember_last = true,
        },
      },
    })
  end,
}
