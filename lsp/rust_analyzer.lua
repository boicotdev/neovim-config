return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'clippy' }, -- Ejemplo: usa clippy en lugar de check
      inlayHints = {
        bindingModeHints = { enable = true },
        closureReturnTypeHints = { enable = "always" },
      },
    }
  },
}
