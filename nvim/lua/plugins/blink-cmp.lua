return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = { preset = "super-tab" },
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = { auto_show = true },
			list = { selection = { preselect = true, auto_insert = true } },
			menu = { max_height = 15 },
			ghost_text = { enabled = true },
		},
		sources = {
			default = { "lsp", "path", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust" },
	},
}
