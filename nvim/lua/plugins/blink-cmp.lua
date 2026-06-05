return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	build = function()
		if vim.fn.executable("cargo") ~= 1 then
			return
		end
		require("blink.cmp").build():pwait()
	end,
	dependencies = {
		"saghen/blink.lib",
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			opts = {},
		},
	},
	opts = {
		keymap = { preset = "enter" },
		appearance = { nerd_font_variant = "mono" },
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			list = { selection = { preselect = true, auto_insert = true } },
			menu = { max_height = 15 },
			ghost_text = { enabled = true },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		snippets = { preset = "luasnip" },
		fuzzy = { implementation = vim.fn.executable("cargo") == 1 and "prefer_rust_with_warning" or "lua" },
		signature = { enabled = true },
	},
}