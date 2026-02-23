--[[
  todo-comments.nvim：高亮注释里的 TODO/FIX/HACK/NOTE 等关键词，并可跳转、搜全项目。

  原理：
  - 用 pattern 匹配注释中的关键字（如 TODO:、FIX:、HACK:），按 keyword 上色（可接 TreeSitter 只高亮注释内）。
  - 可选在 signcolumn 显示图标（当前关闭 signs）。
  - 搜索用 ripgrep，支持 :TodoQuickFix / :TodoLocList / :TodoTelescope 列全项目 todo。

  当前配置：
  - signs = false：不在 signcolumn 显示图标，仅高亮行内关键字。
  - 关键字默认：TODO、FIX(FIXME/BUG/ISSUE)、HACK、WARN(WARNING/XXX)、PERF、NOTE、TEST 等，可自定义 keywords / colors。

  常用命令：
  - :TodoTelescope — 用 Telescope 搜所有 todo（可 cwd=、keywords=TODO,FIX）。
  - :TodoQuickFix / :TodoLocList — 把 todo 填进 quickfix / location list。
  - 按键：]t 下一个、[t 上一个（见下方 keymaps）。
]]

return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
  },
  opts = {
    signs = false,
    -- 可选：只高亮某几类，或改 keywords/colors，见 README
    -- keywords = { ... },
    -- highlight = { comments_only = true, ... },
  },
}
