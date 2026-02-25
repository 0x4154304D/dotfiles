return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		icons = { mappings = vim.g.have_nerd_font },
		spec = {
			{ "<leader>e", group = "Oil [E]xplorer" },
			{ "<leader>f", group = "[F]ind (Telescope)" },
			{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			{ "<leader>c", group = "[C]ode / format" },
			{ "<leader>q", group = "[Q]uickfix / diagnostics" },
		},
	},
}