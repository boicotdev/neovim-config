# Neovim Configuration

A modern, minimal Neovim configuration with lazy.nvim plugin manager and Tokyo Night theme.

## Features

- **Lazy Loading**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast startup
- **Modern Defaults**: Sensible settings for a productive editing experience
- **Nerd Font Support**: Full icon support with Nerd Fonts
- **Fish Shell Integration**: Configured to use Fish as the default shell
- **Spell Checking**: Built-in US English spell checking enabled
- **Hybrid Line Numbers**: Absolute + relative for easy vim motions
- **System Clipboard**: Async clipboard sync to avoid startup delay

## Requirements

- Neovim >= 0.8 (0.9+ recommended)
- Git
- [Fish Shell](https://fishshell.com/) (or modify `vim.opt.shell`)
- [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)

## Installation

### Backup Existing Configuration

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Clone Repository

```shellscript
git clone https://github.com/boicotdev/nvim-config.git ~/.config/nvim
```

### Launch Neovim

```shellscript
nvim
```

Lazy.nvim will automatically bootstrap and install all plugins on first launch.

## Configuration Structure

```plaintext
~/.config/nvim/
├── init.lua              # Main configuration file
└── lua/
    └── plugins/
        └── lazy.lua      # Plugin specifications
```

## Key Settings

| Setting | Value | Description
|-----|-----|-----
| Leader Key | `Space` | Primary modifier for custom keybindings
| Tab Width | 2 spaces | Indent with 2 spaces (expandtab enabled)
| Line Numbers | Hybrid | Absolute + relative for easy motions
| Mouse | Disabled | Set to `"a"` in config to enable
| Clipboard | System | Synced with system clipboard
| Theme | Tokyo Night | Dark theme variant
| Spell Check | Enabled | US English dictionary
| Search | Smart Case | Case sensitive only with uppercase


## Customization

### Enable Mouse Support

```lua
vim.opt.mouse = "a"
```

### Enable GUI Colors

```lua
vim.opt.termguicolors = true
```

### Change Shell

```lua
vim.opt.shell = "zsh"  -- or "bash"
```

### Enable Sign Column

Uncomment in `init.lua`:

```lua
vim.opt.signcolumn = "yes"
```

### Enable Cursor Line Highlight

```lua
vim.opt.cursorline = true
```

### Enable Persistent Undo

```lua
vim.opt.undofile = true
```

### Show Invisible Characters

```lua
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}
```

## Filetype Support

Custom filetype detection is configured for:

| Extension | Filetype | Description
|-----|-----|-----
| `.astro` | astro | Astro framework components
| `Podfile` | ruby | CocoaPods dependency file


## Default Keybindings

The leader key is set to `Space`. Plugin-specific keybindings depend on your `lua/plugins/lazy.lua` configuration.

## Troubleshooting

### Slow Startup

The clipboard is loaded asynchronously via `vim.schedule()` to prevent startup delays. If issues persist, check your clipboard provider:

```plaintext
:checkhealth
```

### Missing Icons

Ensure you have a Nerd Font installed and configured in your terminal emulator.

### Plugin Issues

Clear plugin cache and reinstall:

```shellscript
rm -rf ~/.local/share/nvim/lazy
nvim
```

### Spell Check Errors

Download spell files if missing:

```plaintext
:set spell
```

Neovim will prompt to download the dictionary automatically.

## Version-Specific Features

| Feature | Required Version
|-----|-----|-----
| Hidden command line | Neovim 0.8+
| Split keep cursor | Neovim 0.9+


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager
- [Tokyo Night](https://github.com/folke/tokyonight.nvim) - Beautiful color scheme
- [Neovim](https://neovim.io/) - Hyperextensible Vim-based text editor


```plaintext

```
