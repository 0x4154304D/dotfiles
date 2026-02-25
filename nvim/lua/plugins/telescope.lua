--[[
  telescope.nvim：可扩展的「模糊查找器」，对各类列表做搜索、筛选、预览、执行动作。

  原理：
  - 基于 plenary.nvim，每个「列表」是一个 picker（如 find_files、live_grep、buffers）。
  - 输入框模糊匹配 → 排序（fzf-native 加速）→ 预览窗口显示当前项。
  - 选中的项可执行 action：打开文件、进 quickfix 等。

  当前按键：
  - <leader>ff/fg/fb/fh/fd/fr/fs：文件、grep、buffers、help、诊断、最近、文档符号。
  - <leader>fR：恢复上一次 picker；<leader>fw：当前光标/选中词 grep；<leader>/：当前 buffer 内模糊搜。
  - LSP attach 后 buffer 内：grr 引用、grd 定义、gri 实现、grt 类型定义、gO 文档符号、gW 工作区符号。
  - 扩展 ui-select：LSP code action 等「选择列表」会用 Telescope 下拉，更好看、可模糊搜。
]]

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
		{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
		{ "<leader>fR", "<cmd>Telescope resume<cr>", desc = "Resume last picker" },
		{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor" },
		{
			"<leader>/",
			function()
				local builtin = require("telescope.builtin")
				local themes = require("telescope.themes")
				builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
			end,
			desc = "Fuzzy find in current buffer",
		},
		{
			"<leader>fn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in Neovim config",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local themes = require("telescope.themes")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = { prompt_position = "top" },
				file_ignore_patterns = { "node_modules", ".git/", "vendor/" },
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
			},
			pickers = {
				find_files = { hidden = true },
				buffers = { sort_lastused = true },
			},
			extensions = {
				["ui-select"] = themes.get_dropdown(),
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("telescope-lsp", { clear = true }),
			callback = function(ev)
				local buf = ev.buf
				vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "Goto references" })
				vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "Goto definition" })
				vim.keymap.set("n", "gri", function()
					if not pcall(builtin.lsp_implementations) then
						vim.notify("No LSP implementations found", vim.log.levels.INFO)
					end
				end, { buffer = buf, desc = "Goto implementation" })
				vim.keymap.set("n", "grt", function()
					if not pcall(builtin.lsp_type_definitions) then
						vim.notify("No LSP type definitions found", vim.log.levels.INFO)
					end
				end, { buffer = buf, desc = "Goto type definition" })
				vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "Document symbols" })
				vim.keymap.set(
					"n",
					"gW",
					builtin.lsp_dynamic_workspace_symbols,
					{ buffer = buf, desc = "Workspace symbols" }
				)
			end,
		})
	end,
}
