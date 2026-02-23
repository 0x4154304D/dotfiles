return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		-- delay between pressing a key and opening which-key (milliseconds)
		delay = 0,
		icons = { mappings = vim.g.have_nerd_font },

		-- Document existing key chains (matches telescope, oil, gitsigns, conform)
		spec = {
			{ "<leader>e", group = "Oil [E]xplorer" },
			-- [F]ind (Telescope)
			{ "<leader>f", group = "[F]ind (Telescope)" },
			{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
			{ "<leader>t", group = "[T]oggle" },
			-- Git [H]unk (gitsigns)
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			{ "<leader>c", group = "[C]ode / format" },
			{ "<leader>q", group = "[Q]uickfix / diagnostics" },
		},
	},
}