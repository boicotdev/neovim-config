```markdown
# Minimal Neovim Configuration

A minimal and modern Neovim configuration focused on using native features only, without plugin managers or external frameworks.

This setup relies on the built-in LSP client, native completion, and a clean modular structure.

The goal is to keep the editor fast, simple, and maintainable.

## Features

- Native Neovim LSP client
- No plugin managers
- Minimal configuration
- Native completion using `omnifunc`
- Automatic formatting for Rust and C via LSP
- Simple modular configuration
- Built-in file explorer using `netrw`
- Smart indentation and search behavior
- System clipboard integration

## Requirements

- Neovim >= 0.11
- Installed language servers:

| Language            | LSP Server        |
| ------------------- | ----------------- |
| C / C++             | `clangd`          |
| Rust                | `rust-analyzer`   |
| Python              | `pyright`         |
| HTML / JS formatting| `prettier`        |

Example installation:

```bash
npm install -g pyright
npm install -g prettier
```

Rust analyzer and clangd are usually installed via system package managers.

Installation

1. Backup your current configuration:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

1. Clone this repository:

```bash
git clone https://github.com/boicotdev/neovim-config.git ~/.config/nvim
```

1. Launch Neovim:

```bash
nvim
```

Configuration Structure

```
~/.config/nvim
│
├── init.lua
│
├── lsp
│   ├── clangd.lua
│   ├── html.lua
│   ├── prettier.lua
│   ├── pyright.lua
│   └── rust_analyzer.lua
│
└── lua
    └── config
        ├── diagnostics.lua
        └── keymaps.lua
```

init.lua

Main configuration file containing:

· editor options
· UI configuration
· search behavior
· indentation rules
· filetype detection
· netrw configuration
· completion behavior
· LSP activation

lsp/

Each file defines configuration for a specific language server.

Example:

· clangd.lua → C/C++
· rust_analyzer.lua → Rust
· pyright.lua → Python
· prettier.lua → formatting
· html.lua → HTML language server

These modules are loaded automatically by the native LSP client.

lua/config/keymaps.lua

Contains all custom key mappings used by the editor.

Example LSP mappings:

Key Action
gd Go to definition
gD Go to declaration
gi Go to implementation
gr List references
K Show hover documentation

lua/config/diagnostics.lua

Controls how LSP diagnostics are displayed.

Includes configuration for:

· virtual text
· signs
· underline
· severity sorting

Editor Behavior

Indentation

Setting Value
Tab width 2 spaces
Expand tabs enabled
Smart indentation enabled

Search

· Case insensitive by default
· Automatically case sensitive when uppercase letters are used
· Live preview for substitutions

Line Numbers

Hybrid line numbers are enabled:

· absolute numbers
· relative numbers for movement

Spell Checking

Spell checking is enabled using:

· en_us

File Explorer

This configuration uses the native netrw file explorer.

It is configured to display files in tree view similar to NerdTree but without plugins.

Built-in Completion

Completion uses Neovim's built-in omnifunc.

When typing in insert mode, the configuration automatically triggers:

· <C-x><C-o>
  to display completion suggestions when available.

Formatting

Automatic formatting is enabled on save for:

Language Formatter
Rust rustfmt
C clangd formatter

Python formatting is intentionally not automated.

Clipboard

System clipboard integration is enabled using:

· unnamedplus

This allows copying and pasting between Neovim and the system.

Customization

Enable mouse support

```lua
vim.opt.mouse = "a"
```

Enable true colors

```lua
vim.opt.termguicolors = true
```

Change default shell

```lua
vim.opt.shell = "zsh"
```

Philosophy

This configuration follows a minimalist philosophy:

· prefer native features
· avoid unnecessary plugins
· keep the configuration readable
· maintain full control of the editor behavior

License

MIT License

```
