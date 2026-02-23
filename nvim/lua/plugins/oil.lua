--[[
  oil.nvim：把「当前目录」当成一个可编辑的 buffer，用普通 Vim 操作改文件名、删/移文件。

  原理：
  - 打开目录（:Oil、nvim .、<leader>e、- 进上级）时，buffer 里是「目录列表」的文本形式。
  - 你像改文本一样改名字、删行、粘贴，:w 后真正执行重命名/删除/移动；支持跨目录复制粘贴。
  - 类似 vim-vinegar + netrw 的「单目录列表」浏览，但可像 buffer 一样编辑，并支持 SSH/S3 adapter。

  当前配置：
  - default_file_explorer = true：打开目录时用 Oil 而非 netrw。
  - columns：图标、权限、大小、修改时间。
  - view_options：显示隐藏文件，但始终隐藏 ".." 和 ".git"。
  - delete_to_trash、skip_confirm_for_simple_edits：删到回收站、简单编辑不二次确认。
  - 键位：q 关，<C-r> 刷新，<C-p> 预览，<C-s>/<C-v> 水平/垂直分屏打开。
]]

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>Oil<cr>", desc = "Open file browser" },
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == ".." or name == ".git"
      end,
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["q"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["<C-p>"] = "actions.preview",
      ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
    },
  },
}
