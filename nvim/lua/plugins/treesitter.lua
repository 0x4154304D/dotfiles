return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter",
	opts = {
		ensure_installed = {
			"go",
			"c",
			"cpp",
			"lua",
			"python",
			"bash",
			"markdown",
			"markdown_inline",
			"yaml",
			"json",
		},
		auto_install = true,
		ignore_install = {},
	},
}
