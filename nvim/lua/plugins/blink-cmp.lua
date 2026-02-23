--[[
  blink.cmp：补全插件，支持 LSP、path、snippet、buffer 等 source，带模糊匹配和签名提示。

  原理：
  - 输入时异步拉取 LSP/path/snippets 等 source，用模糊匹配（可选用 Rust 实现）排序，带 frecency/邻近加分。
  - 与 Neovim 内置补全行为对齐：keymap 用 "default" 时 <c-y> 接受、自动 import/展开 snippet；"super-tab" 则用 Tab 接受。
  - 依赖 LuaSnip 时需安装并 build（make install_jsregexp），snippets source 才能用。

  当前配置：
  - keymap：preset "default"（<c-y> 接受，Tab/S-Tab 在 snippet 里跳，<c-space> 开菜单/文档，<c-e> 关，<c-k> 签名）。可改为 "super-tab" 用 Tab 接受。
  - appearance：nerd_font_variant = "mono" 对齐图标。
  - completion：文档可 auto_show、preselect、ghost_text、auto_brackets；menu max_height 15。
  - sources：lsp、path、snippets（依赖 LuaSnip）、buffer。
  - snippets：preset luasnip。
  - fuzzy：prefer_rust 优先用 Rust 实现（无则自动回退 lua）；可改为 "lua" 免下载。
  - signature：输入函数参数时显示签名帮助。
]]

return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "VimEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "2.*",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      opts = {},
    },
  },
  opts = {
    keymap = {
      preset = "enter", -- "default" | "super-tab" | "enter" | "none"
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      list = { selection = { preselect = true, auto_insert = true } },
      menu = { max_height = 15 },
      ghost_text = { enabled = true },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "prefer_rust" },
    signature = { enabled = true },
  },
}
