-- 状态栏插件：yaziline
-- require("yaziline"):setup {
--   separator_style = "curvy",
--   select_symbol = "S",
--   yank_symbol = "Y",
--   filename_max_length = 24,
--   filename_truncate_length = 6,
--   filename_truncate_separator = "...",
-- }

-- 顶部 starship 栏（需要先安裝：brew install starship）
require("starship"):setup {
  config_file = "~/.config/yazi/starship.toml",
}

-- Git 状态标记
require("git"):setup {}

-- 在状态栏右侧显示 文件的 user:group
Status:children_add(function()
  local h = cx.active.current.hovered
  if h == nil or ya.target_family() ~= "unix" then
    return ui.Line {}
  end

  return ui.Line {
    ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
    ui.Span(":"),
    ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
    ui.Span(" "),
  }
end, 500, Status.RIGHT)

-- 书签插件：yamb（使用 fzf）
-- require("yamb"):setup {
--   cli = "fzf",
--   jump_notify = true,
--   path = (os.getenv("HOME") .. "/.config/yazi/bookmark"),
-- }
