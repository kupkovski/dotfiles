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
require("lazy").setup({
  { "tpope/vim-commentary" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },  
  {
    'projekt0n/github-nvim-theme',
    lazy = false, 
    priority = 1000, 
    config = function()
      require('github-theme').setup()
      vim.cmd('colorscheme github_light')
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {  
        update_cwd = true,
          update_focused_file = {
            enable = true,
            update_cwd = true,
          },
          actions = {
            open_file = {
              quit_on_open = true,
            },
          },
          filters = {
            dotfiles = false,
            git_ignored = false
          },
          git = {
            enable = true
          }
        }
    end,
  },{
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    "nvim-treesitter/nvim-treesitter-refactor"
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    -- change the default behavior of yank on deleting
    "tpope/vim-repeat",
    dependencies = { "svermeulen/vim-easyclip" }
  }
})


require('lualine').setup()

---------------------------------
-- treesitter configs

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "vim", "ruby", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  indent = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_current_scope = { enable = true },
    smart_rename = {
       enable = true,
       -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
       keymaps = {
         smart_rename = "grr",
       },
    },    
    navigation = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<A-*>",
        goto_previous_usage = "<A-#>",
      },
    },
  },
}

--
---------------------------------
-- Custom Keybindings

-- Toggle Nvim Tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-----------------------------------------
-- whichkey
--
local wk = require("which-key")
local default_telescope_opts = {noremap = true}

wk.register({ 
  f = {
    name = "file",
    f = { "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git', '-u' }})<cr>", "Find File" },
    q = { "<cmd>:wq<cr>", "Save and Quit" },
    d = { "<cmd>:Telescope live_grep search_dirs=%:p:h<CR>", "search in directory"},
    r = { "<cmd>:NvimTreeFindFile<CR>", "Reveal in NvimTree" }
  },
  w = {
    name = "window",
    v = { "<cmd>:vsp<cr>", "split Vertical" },
    h = { "<cmd>:split<cr>", "split Horizontal" }
  },
  prefix = "<leader>" 
})
