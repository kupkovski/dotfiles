require('telescope').setup({
  defaults = {
    -- These three settings are optional, but recommended.
    prompt_prefix = '',
    entry_prefix = ' ',
    selection_caret = ' ',

    -- This is the important part: without this, Telescope windows will look a
    -- bit odd due to how borders are highlighted.
    layout_strategy = 'grey',
    layout_config = {
     -- The extension supports both "top" and "bottom" for the prompt.
      prompt_position = 'bottom',

      -- You can adjust these settings to your liking.
      width = 0.6,
      height = 0.5,
      preview_width = 0.6,
    },
  }
})

local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('undo')
-- telescope.load_extension('dir')
telescope.load_extension('grey')

require("dir-telescope").setup({
      -- these are the default options set
      debug=true,
      hidden = true,
      no_ignore = false,
      show_preview = true,
    })

require("nvim-tree").setup({
	update_cwd = true,
	update_focused_file = {
    enable = true,
		update_cwd = true,
	},
	git = {
    enable = true
	},
	filters = {
    dotfiles = false,
		git_ignored = false
  }
})

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})

vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

