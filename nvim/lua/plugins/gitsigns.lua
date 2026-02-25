return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
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
			map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
			map("n", "<leader>hi", gs.preview_hunk_inline, { desc = "Preview hunk inline" })

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, { desc = "Blame line (popup)" })
			map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, { desc = "Diff this (~)" })
			map("n", "<leader>hq", gs.setqflist, { desc = "Hunks to quickfix" })
			map("n", "<leader>hQ", function()
				gs.setqflist("all")
			end, { desc = "Hunks to quickfix (all)" })
			map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
			map("n", "<leader>tw", gs.toggle_word_diff, { desc = "Toggle word diff" })
			map({ "o", "x" }, "ih", gs.select_hunk, { desc = "Select hunk" })
		end,
	},
}