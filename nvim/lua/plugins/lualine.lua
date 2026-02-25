--[[
  lualine.nvim：底部状态栏（statusline），按「段」放组件，只加载你配置的组件，性能好。

  布局（从左到右）：
  +--------------------------------------------------+
  | A | B | C                        X | Y | Z        |
  +--------------------------------------------------+
  - A/B/C：左侧（模式、分支/diff、文件名等）
  - X/Y/Z：右侧（诊断、位置/选中数、编码/格式/文件类型等）

  当前配置：
  - options：theme "auto" 随 colorscheme，globalstatus 单行状态栏多窗口共用，分隔符简洁（section 空、component "|"）。
  - sections：a=模式，b=分支+diff，c=文件名(path=1 显示一级父目录)，x=诊断，y=位置+选中数，z=编码+格式+文件类型。
  - inactive_sections：非当前窗口只显示文件名和位置，减少干扰。

  常用组件：branch, diff, diagnostics, encoding, fileformat, filename, filetype, location, mode, progress, selectioncount, tabs, lsp_status。
  可选：tabline（标签栏）、winbar（窗口顶栏）、extensions（如 quickfix）、theme 改固定主题。
]]

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			section_separators = "",
			component_separators = "|",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "diagnostics" },
			lualine_y = { "location", "selectioncount" },
			lualine_z = { "encoding", "fileformat", "filetype" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
