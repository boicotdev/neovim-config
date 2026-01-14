-- =============================================================================
-- NEOVIM CONFIGURATION
-- =============================================================================
-- Author: Carlos Alberto Guzmán.
-- Description: Personal Neovim configuration with lazy.nvim plugin manager
-- =============================================================================

-- =============================================================================
-- LEADER KEY
-- =============================================================================
-- Must be set before loading plugins for proper keybinding mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =============================================================================
-- GLOBAL FLAGS
-- =============================================================================
vim.g.have_nerd_font = true          -- Enable Nerd Font icons support
vim.g.deprecation_warnings = true    -- Show deprecation warnings for debugging

-- =============================================================================
-- ENCODING
-- =============================================================================
vim.opt.encoding = "utf-8"           -- Internal encoding
vim.opt.fileencoding = "utf-8"       -- File encoding when writing

-- =============================================================================
-- SPELLING
-- =============================================================================
vim.opt.spell = true                 -- Enable spell checking
vim.opt.spelllang = { "en_us" }      -- Set spell check language to US English

-- =============================================================================
-- LINE NUMBERS
-- =============================================================================
vim.opt.number = true                -- Show absolute line numbers
vim.opt.relativenumber = true        -- Show relative line numbers for easy motion

-- =============================================================================
-- USER INTERFACE
-- =============================================================================
vim.opt.title = true                 -- Set window title to current file
vim.opt.showmode = false             -- Hide mode indicator (shown in statusline)
vim.opt.showcmd = true               -- Show partial commands in last line
vim.opt.cmdheight = 1                -- Command line height (overridden below for 0.8+)
vim.opt.laststatus = 2               -- Always show statusline
vim.opt.termguicolors = false        -- Use terminal colors (set true for GUI colors)
vim.opt.scrolloff = 10               -- Keep 10 lines visible above/below cursor

-- =============================================================================
-- SEARCH
-- =============================================================================
vim.opt.hlsearch = true              -- Highlight all search matches
vim.opt.ignorecase = true            -- Case insensitive search by default
vim.opt.smartcase = true             -- Case sensitive if uppercase in pattern
vim.opt.inccommand = "split"         -- Live preview substitutions in split window

-- =============================================================================
-- INDENTATION
-- =============================================================================
vim.opt.autoindent = true            -- Copy indent from current line on new line
vim.opt.smartindent = true           -- Smart autoindenting for C-like programs
vim.opt.smarttab = true              -- Insert shiftwidth spaces at line start
vim.opt.breakindent = true           -- Preserve indent on wrapped lines
vim.opt.expandtab = true             -- Convert tabs to spaces
vim.opt.tabstop = 2                  -- Number of spaces per tab character
vim.opt.shiftwidth = 2               -- Number of spaces for autoindent
vim.opt.softtabstop = 2              -- Number of spaces per Tab keypress

-- =============================================================================
-- TEXT BEHAVIOR
-- =============================================================================
vim.opt.wrap = false                 -- Disable line wrapping
vim.opt.backspace = {                -- Allow backspace over:
  "start",                           --   text inserted before current insert
  "eol",                             --   line breaks
  "indent"                           --   autoindent
}

-- =============================================================================
-- WINDOW SPLITS
-- =============================================================================
vim.opt.splitbelow = true            -- Horizontal splits open below current window
vim.opt.splitright = true            -- Vertical splits open right of current window
vim.opt.splitkeep = "cursor"         -- Keep cursor position when splitting

-- =============================================================================
-- BUFFERS & FILES
-- =============================================================================
vim.opt.hidden = true                -- Allow switching buffers without saving
vim.opt.confirm = false              -- Don't prompt to save on quit
vim.opt.backup = false               -- Disable backup files
vim.opt.backupskip = {               -- Skip backups for these paths
  "/tmp/*",
  "/private/tmp/*"
}

-- =============================================================================
-- INPUT DEVICES
-- =============================================================================
vim.opt.mouse = ""                   -- Disable mouse (set to "a" to enable)

-- =============================================================================
-- SHELL
-- =============================================================================
vim.opt.shell = "fish"               -- Set default shell for :! commands

-- =============================================================================
-- FILE SEARCH
-- =============================================================================
vim.opt.path:append({ "**" })        -- Search recursively in subdirectories
vim.opt.wildignore:append({          -- Ignore these patterns in file searches
  "/node_modules/*"
})

-- =============================================================================
-- CLIPBOARD
-- =============================================================================
-- Scheduled to prevent startup delay when syncing with system clipboard
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"  -- Use system clipboard for all operations
end)

-- =============================================================================
-- TERMINAL SUPPORT
-- =============================================================================
-- Enable undercurl support in compatible terminals
vim.cmd([[let &t_Cs = "\e[4:3m"]])   -- Start undercurl
vim.cmd([[let &t_Ce = "\e[4:0m"]])   -- End undercurl

-- =============================================================================
-- FORMAT OPTIONS
-- =============================================================================
-- Automatically insert comment leader after hitting <Enter> in Insert mode
vim.opt.formatoptions:append({ "r" })

-- =============================================================================
-- FILETYPE DETECTION
-- =============================================================================
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])  -- Astro framework files
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])   -- CocoaPods Podfile as Ruby

-- =============================================================================
-- VERSION-SPECIFIC SETTINGS
-- =============================================================================
-- Hide command line when not in use (requires Neovim 0.8+)
if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- =============================================================================
-- PLUGIN MANAGER (lazy.nvim)
-- =============================================================================
-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- LOAD PLUGINS
-- =============================================================================
-- Plugin specifications are defined in lua/plugins/lazy.lua
require("plugins.lazy")

-- =============================================================================
-- COLORSCHEME
-- =============================================================================
vim.cmd.colorscheme("tokyonight-night")
