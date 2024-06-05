return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").register({
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
  end
}
