--[[
  gitsigns.nvim：在 buffer 里集成 Git 状态与操作。

  原理：
  - 监听工作区 .git 目录与当前文件，用 libuv 做异步 diff，不阻塞编辑。
  - 在 signcolumn 显示行级状态（新增/修改/删除），可选的 numhl/linehl 高亮整行。
  - 提供 hunk（连续变更块）概念：可 stage/reset 单个 hunk、在 hunk 间跳转、预览 diff。
  - blame 信息可整 buffer 弹窗或当前行用 virt_text 显示（当前行即你开的 current_line_blame）。

  当前已开选项：
  - signs：左侧符号（+ ~ _ ‾），你改成了简单 ASCII，无 Nerd Font 也能看清。
  - watch_gitdir.follow_files：跟踪文件移动/重命名，保持 attach 的 buffer 正确。
  - current_line_blame：当前行行尾显示「谁、何时、提交信息」；:Gitsigns toggle_current_line_blame 开关。
  - current_line_blame_opts：virt_text 在行尾、delay 100ms、use_focus 只在前台更新。
  - current_line_blame_formatter：展示格式，如 "Author, 12:34 - summary"。
  - max_file_length：超过 3000 行不挂 gitsigns，避免大文件卡顿。

  其他常用选项（未写则用默认）：
  - signcolumn = true/false，:Gitsigns toggle_signs 可关掉 signs。
  - numhl / linehl：行号或整行高亮变更，:Gitsigns toggle_numhl / toggle_linehl。
  - word_diff = true：行内按词 diff；:Gitsigns toggle_word_diff。
  - signs_staged / signs_staged_enable：staged 时用不同符号。
  - on_attach：下面用官方推荐的 keymaps，<leader>h 与 which-key 的 "Git [H]unk" 对应。
]]

return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    watch_gitdir = { follow_files = true },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 100,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> · <summary>",
    max_file_length = 3000,

    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Hunk 跳转（diff 模式下 ]c/[c 走 diff，否则走 hunk）
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, { desc = "Next hunk" })
      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, { desc = "Prev hunk" })

      -- Stage / reset hunk（visual 下对选中行）
      map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage hunk" })
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset hunk" })

      map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })

      -- 预览
      map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>hi", gs.preview_hunk_inline, { desc = "Preview hunk inline" })

      -- Blame / diff
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, { desc = "Blame line (popup)" })
      map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, { desc = "Diff this (~)" })

      -- Quickfix
      map("n", "<leader>hq", gs.setqflist, { desc = "Hunks to quickfix" })
      map("n", "<leader>hQ", function()
        gs.setqflist("all")
      end, { desc = "Hunks to quickfix (all)" })

      -- Toggles
      map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
      map("n", "<leader>tw", gs.toggle_word_diff, { desc = "Toggle word diff" })

      -- 文本对象：vih 选中当前 hunk
      map({ "o", "x" }, "ih", gs.select_hunk, { desc = "Select hunk" })
    end,
  },
}
