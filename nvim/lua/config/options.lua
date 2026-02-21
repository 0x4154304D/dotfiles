vim.env.PATH = table.concat({
    vim.fn.expand("~/go/bin"),
    vim.fn.expand("~/.local/bin"),
    vim.fn.expand("~/.cargo/bin"),
    "/opt/homebrew/bin",
    vim.env.PATH,
}, ":")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer" }
        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = "NONE" })
        end
    end,
})
vim.cmd.colorscheme(vim.g.colors_name or "default")
