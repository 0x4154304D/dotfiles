return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash", "zsh" },
    settings = {
        bashIde = {
            shellcheckPath = "shellcheck",
            highlightParsingErrors = true,
        },
    },
}
