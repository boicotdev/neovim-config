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
vim.g.have_nerd_font = false          -- Enable Nerd Font icons support
vim.g.deprecation_warnings = true    -- Show deprecation warnings for debugging
vim.g.editorconfig = true
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
vim.opt.cursorline = true -- Show which line your cursor is on
-- =============================================================================
-- USER INTERFACE
-- =============================================================================
vim.opt.title = true                 -- Set window title to current file
vim.opt.showmode = true             -- Hide mode indicator (shown in statusline)
vim.opt.showcmd = true               -- Show partial commands in last line
vim.opt.cmdheight = 1                -- Command line height (overridden below for 0.8+)
vim.opt.laststatus = 2               -- Always show statusline
vim.opt.termguicolors = false       -- Use terminal colors (set true for GUI colors)
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
vim.opt.shell = "bash" --fish --zsh              -- Set default shell for :! commands
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


vim.g.rustfmt_autosave = 1

-- LSP formatting (Rust y C)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.rs","*.c","*.h"},
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})



-- =============================================================================
-- VIEW TYPE NERDTREE
-- =============================================================================
vim.g.netrw_banner = 0        -- Quit the banner
vim.g.netrw_liststyle = 3    -- View type tree
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.opt.completeopt = { "menu", "menuone", "noselect" }


vim.api.nvim_create_autocmd("InsertCharPre", {
  callback = function()
    -- Do nothing if a menu is already
    if vim.fn.pumvisible() == 1 then return end

    -- Only if omnifunc exists. 
    local omnifunc = vim.bo.omnifunc
    if omnifunc == nil or omnifunc == "" then return end

    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true),
      "n",
      false
    )
  end,
})

-- 
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, "Go to references")
    map("n", "K",  vim.lsp.buf.hover, "Hover documentation")
  end,
})
vim.keymap.set("n", "<leader>R", function()
  vim.cmd("source $MYVIMRC")
  vim.cmd("LspRestart")
  print("Neovim recargado")
end, { desc = "Reload Neovim" })

vim.keymap.set("i", "<C-y>", function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn["complete_info"]().selected ~= -1
    and vim.api.nvim_replace_termcodes("<C-y>", true, false, true)
    or vim.api.nvim_replace_termcodes("<C-n><C-y>", true, false, true)
  end
  return vim.api.nvim_replace_termcodes("<CR>", true, false, true)
end, { expr = true, silent = true })

require('config.keymaps')
require('config.diagnostics')
vim.lsp.enable({
    'clangd',
    'rust_analyzer',
    'prettier',
    'pyright',
    'lua_server',
    'typescriptjs'
  })
