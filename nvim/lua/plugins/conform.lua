--[[
  conform.nvim：按文件类型调用外部 formatter，统一「保存时格式化」和「手动格式化」。

  原理：
  - 按 formatters_by_ft 为每种 filetype 配置一个或多个 formatter（如 lua → stylua）。
  - 保存时若 format_on_save 开启，在 BufWritePre 里调用 conform.format()，用最小 diff 写回。
  - lsp_format 控制何时用 LSP：never / fallback（无外部时用 LSP）/ prefer / first / last。

  当前配置：
  - formatters_by_ft：go/c/cpp/lua/python/sh/markdown/yaml 等；["*"] = codespell 对所有 ft 纠拼写。
  - format_on_save：有 formatter 即执行（含 c/cpp）；lsp_format = "fallback" 无外部 formatter 时用 LSP。
  - <leader>cf：手动格式化，async + lsp_format = "fallback"（无外部时用 LSP）。
  - cmd = "ConformInfo"：运行 :ConformInfo 时也会加载插件，方便排查。
]]

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format file",
		},
	},
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			go = { "goimports", "gofumpt", "golines" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			sh = { "shfmt" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			-- 对所有 filetype 跑一遍 codespell（纠拼写），需安装：brew install codespell / pip install codespell
			["*"] = { "codespell" },
			-- 多 formatter 只跑第一个可用的：javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = function(bufnr)
			local formatters = require("conform").list_formatters(bufnr)
			if not formatters or #formatters == 0 then
				return nil
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
}