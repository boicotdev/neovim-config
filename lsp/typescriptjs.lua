return {
  cmd = { "typescript-language-server", "--stdio" },

  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },

  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },

  settings = {
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayVariableTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
      },
    },

    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayVariableTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
      },
    },
  },
}

