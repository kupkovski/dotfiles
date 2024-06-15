return  {
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
}
