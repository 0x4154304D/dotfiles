return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_markers = { "go.mod", "go.work" },
	settings = {
		gopls = {
			gofumpt = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
