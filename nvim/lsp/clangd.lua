return {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--fallback-style=llvm",
        "--query-driver=/usr/bin/clang,/usr/bin/clang++,/usr/bin/g++,/usr/bin/gcc",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { "compile_commands.json", ".clangd", ".clang-format", "Makefile" },
}
