--[[
  nvim-treesitter：用 TreeSitter 做高亮、缩进、折叠等，按语言用不同 parser。

  原理：
  - 每种语言一个 parser（从 ensure_installed 安装），打开文件时对 buffer 挂载对应 parser。
  - 高亮/缩进/折叠等基于 AST，比纯正则更准；LSP、conform、todo-comments 等可依赖 TS 的“只在注释内”等能力。

  当前配置：
  - ensure_installed：启动时保证这些语言的 parser 已安装；可增删。
  - auto_install：打开未在列表里的语言时会自动安装对应 parser（首次可能稍慢）。
  - build = ":TSUpdate"：安装/更新时执行，保证 parser 可用。
]]

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "go",
      "c",
      "cpp",
      "lua",
      "luadoc",
      "python",
      "bash",
      "markdown",
      "markdown_inline",
      "yaml",
      "json",
      "vim",
      "vimdoc",
      "diff",
      "html",
      "query",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
