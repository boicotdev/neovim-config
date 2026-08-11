return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'clippy' },
      inlayHints = {
        bindingModeHints = { enable = true },
        closureReturnTypeHints = { enable = "always" },
      },
    }
  },
}
