

vim.g.mapleader = " "

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "fish"
vim.opt.backupskip = { "/tmp/", "/private/tmp/" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "/node_modules/" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "" -- set to "a" if wanna activate that option
vim.g.deprecation_warnings = true
vim.g.have_nerd_font = true
vim.opt.smartcase = true
vim.opt.confirm = false
vim.opt.showmode = false
vim.opt.termguicolors = false
-- vim.opt.signcolumn = "yes"


---

-- -- CLIPBOARD (programado para no afectar startup)


---

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- -- INDENTACIÓN


---

-- vim.opt.shiftwidth = 2
-- vim.opt.softtabstop = 2
-- vim.opt.expandtab = false -- tabs reales


---

-- -- UI / EDITOR


---

-- vim.opt.cursorline = true
-- vim.opt.scrolloff = 10
-- vim.opt.breakindent = true
-- vim.opt.undofile = true

-- vim.opt.list = true
-- vim.opt.listchars = {
--   tab = "» ",
--   trail = "·",
--   nbsp = "␣",
-- }

-- vim.opt.inccommand = "split"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
vim.opt.cmdheight = 0
end


-- -- BOOTSTRAP lazy.nvim

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


---

-- -- CARGAR PLUGINS (MODULAR)


---

require("plugins.lazy")


---

-- -- TEMA


---

vim.cmd.colorscheme("tokyonight-night")
