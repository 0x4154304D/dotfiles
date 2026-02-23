-- ─── Bootstrap lazy.nvim ─────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ─── Globals (before any config that may read them) ──────────────────────────
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- ─── Base options ───────────────────────────────────────────────────────────
local function safe_require(name)
  local ok, err = pcall(require, name)
  if not ok then
    vim.notify("Config error loading " .. name .. ": " .. tostring(err), vim.log.levels.ERROR)
  end
end

safe_require("config.options")

-- ─── Plugins (lazy.nvim) ────────────────────────────────────────────────────
require("lazy").setup("plugins", require("config.lazy"))

-- ─── LSP ───────────────────────────────────────────────────────────────────
vim.lsp.enable({ "gopls", "clangd", "pyright", "bashls", "jsonls", "yamlls" })

-- ─── Diagnostics & keymaps (after plugins so which-key etc. can hook) ───────
safe_require("config.diagnostics")
safe_require("config.keymaps")
