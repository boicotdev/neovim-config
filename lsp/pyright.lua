return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },

  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- off | basic | strict
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",

        -- Buen balance entre señal y ruido
        reportMissingImports = true,
        reportMissingTypeStubs = false,
      },
    },
  },
}
