-- Initializing lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------
-- General settings

-- disable netrw nvim plugin as recommended by nvim-tree plugin
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- remap leader to <Space>
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

-- General settings
vim.opt.encoding = "utf-8"
vim.opt.ruler = true
vim.opt.showcmd = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.clipboard = "unnamed"
vim.opt.termguicolors = true

-- display extra whitespaces as dots
vim.cmd("set list listchars=tab:»·,trail:·,nbsp:␣")

-- Drawn a line at 100 character mark
vim.opt.textwidth = 100
vim.opt.colorcolumn = "100"

-- Display numbers and relative numbers
vim.wo.number = true
vim.wo.numberwidth = 5
vim.wo.rnu = true

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Highlight the current line
vim.opt.cursorline = true

-- Folding using identation
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel =  10


--------------------------------------------------
-- plugins

require("lazy").setup("plugins")

-- ---------------------------------
-- -- Custom Keybindings

-- -- Toggle Nvim Tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })


-- Theme
vim.o.background = 'dark'
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "dracula"
vim.cmd.colorscheme "tokyonight"

