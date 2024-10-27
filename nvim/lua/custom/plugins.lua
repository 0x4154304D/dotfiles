local plugins = {
  {
    "vim-crystal/vim-crystal",
    ft = "crystal",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  }
}

return plugins
