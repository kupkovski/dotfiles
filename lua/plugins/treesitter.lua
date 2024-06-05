return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  "nvim-treesitter/nvim-treesitter-refactor",
  config = function()
    require('nvim-treesitter.configs').setup {
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
  end
}
