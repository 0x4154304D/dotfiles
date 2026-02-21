return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format file",
		},
	},
	opts = {
		formatters_by_ft = {
			go = { "goimports", "gofumpt", "golines" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			sh = { "shfmt" },
			markdown = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if not require("conform").formatters_by_ft[ft] then
				return
			end
			return { timeout_ms = 500, lsp_format = "never" }
		end,
	},
}
