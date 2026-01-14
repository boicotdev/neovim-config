return {
  "neovim/nvim-lspconfig",
  config = function()
    --------------------------------------------------
    --------------------------------------------------
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    --------------------------------------------------
    -- Keymaps LSP (modern API)
    --------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- Inlay hints (nativo 0.11)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
      end,
    })

    --------------------------------------------------
    -- C / C++ — clangd (Termux OK)
    --------------------------------------------------
    vim.lsp.config.clangd = {
      cmd = { "clangd" },
      capabilities = capabilities,
    }

    --------------------------------------------------
    -- Rust — rust-analyzer
    --------------------------------------------------
    vim.lsp.config.rust_analyzer = {
      cmd = { "rust-analyzer" },
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = { command = "clippy" },
        },
      },
    }

    --------------------------------------------------
    -- Python — pyright
    --------------------------------------------------
    vim.lsp.config.pyright = {
      cmd = { "pyright-langserver", "--stdio" },
      capabilities = capabilities,
    }

    --------------------------------------------------
    -- Activate servers
    --------------------------------------------------
    vim.lsp.enable({
      "clangd",
      "rust_analyzer",
      "pyright",
    })
  end,
}
