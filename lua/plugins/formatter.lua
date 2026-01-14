return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          python = { "black" },
          c = { "clang-format" },
          rust = { "rustfmt" },
        },

        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      vim.keymap.set(
        "n",
        "<leader>f",
        function() require("conform").format() end,
        { desc = "Format file" }
      )
    end,
  },
}
