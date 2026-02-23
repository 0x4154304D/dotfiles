-- ─── PATH (for LSP/servers and CLI tools) ────────────────────────────────────
vim.env.PATH = table.concat({
  vim.fn.expand("~/go/bin"),
  vim.fn.expand("~/.local/bin"),
  vim.fn.expand("~/.cargo/bin"),
  "/opt/homebrew/bin",
  vim.env.PATH,
}, ":")

-- ─── Appearance ─────────────────────────────────────────────────────────────
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.breakindent = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.scrolloff = 10

-- ─── Editing & indentation ──────────────────────────────────────────────────
vim.o.mouse = "a"
-- 全局默认：新/空 buffer 或 guess-indent 未检测时使用；guess-indent 会按文件内容覆盖当前 buffer。
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- ─── Clipboard ─────────────────────────────────────────────────────────────
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- ─── Undo & search ─────────────────────────────────────────────────────────
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- ─── Performance & UX ───────────────────────────────────────────────────────
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"
vim.o.confirm = true

-- ─── Autocmds ───────────────────────────────────────────────────────────────
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer" }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end,
})
vim.cmd.colorscheme(vim.g.colors_name or "default")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
