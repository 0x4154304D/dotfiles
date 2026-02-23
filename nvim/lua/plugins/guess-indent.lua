--[[
  guess-indent.nvim：根据当前文件内容自动检测缩进风格并设置 buffer 选项。

  原理：
  - 打开 buffer 时（或手动执行 :GuessIndent 时），插件会扫描前几百行。
  - 通过统计缩进（空格 vs Tab、每级缩进宽度）推断：用 Tab 还是空格、缩进宽度是 2/4/8 等。
  - 然后设置当前 buffer 的 expandtab / tabstop / softtabstop / shiftwidth，使编辑行为与文件一致。
  - 类似 Sublime Text 的 “Guess Indentation Settings From Buffer”，执行很快（通常 <1ms）。

  可开启的选项与功能：
  - auto_cmd (默认 true)：打开文件时自动检测；设为 false 则只在你执行 :GuessIndent 时生效。
  - override_editorconfig (默认 false)：为 true 时，猜测结果优先于 .editorconfig；否则 .editorconfig 优先。
  - filetype_exclude：不自动检测的 filetype 列表（默认含 netrw, tutor）。
  - buftype_exclude：不自动检测的 buftype 列表（默认含 help, nofile, terminal, prompt）。
  - on_tab_options：检测到「用 Tab 缩进」时设置的选项，如 expandtab = false。
  - on_space_options：检测到「用空格缩进」时设置的选项；值写 "detected" 表示用检测到的缩进宽度。
  - 还可配合 pre_guess_hook / post_guess_hook 在检测前后执行自定义逻辑。
]]

return {
  "NMAC427/guess-indent.nvim",
  opts = {
    auto_cmd = true,
    override_editorconfig = false,
    filetype_exclude = { "netrw", "tutor" },
    buftype_exclude = { "help", "nofile", "terminal", "prompt" },
    on_tab_options = { expandtab = false },
    on_space_options = {
      expandtab = true,
      tabstop = "detected",
      softtabstop = "detected",
      shiftwidth = "detected",
    },
  },
}
