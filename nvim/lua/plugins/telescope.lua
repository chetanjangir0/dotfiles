return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },

        -- for files preview in side bar
        defaults = {
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  }
}
