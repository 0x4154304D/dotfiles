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
			["q"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			["<C-p>"] = "actions.preview",
			["<C-s>"] = { "actions.select", opts = { horizontal = true } },
			["<C-v>"] = { "actions.select", opts = { vertical = true } },
		},
	},
}
