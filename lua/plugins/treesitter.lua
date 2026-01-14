return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "python",
          "c",
          "rust",
          "json",
          "html",
          "css",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
