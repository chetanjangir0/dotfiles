return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      local builtin = require("telescope.builtin")

      -- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ hidden = true }) -- show dotfiles
      end, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },

        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },

        defaults = {
          color_devicons = true,
          path_displays = { "smart" },
          -- for files preview in side bar
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
          },
          -- file_ignore_patterns = { "node_modules/", ".git/" },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
}
