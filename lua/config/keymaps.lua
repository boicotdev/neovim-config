return {

  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank({
        higroup = "IncSearch",
        timeout = 150,
      })
    end,
  }),


  -- ================================================================================
  -- -- KEYMAPS
  -- ================================================================================

  -- Ir al error anterior/siguiente
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Error anterior' }),
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Error siguiente' }),

  -- Mostrar el mensaje de error completo en una ventana flotante
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'See floating error' }),
  vim.keymap.set(
    "n",
    "<leader>p",
    ":!prettier --write %<CR>",
    { desc = "Format file with Prettier" }
  ),
  vim.keymap.set("n", "<leader>fe", ":Vexplore<CR>", { desc = "File Explorer vertical" }),
  vim.keymap.set("n", "<leader>h", "gT", { noremap = true, silent = true }), -- previous tab
  vim.keymap.set("n", "<leader>l", "gt", { noremap = true, silent = true }), -- next tab

  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
  end)
}
