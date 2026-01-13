return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>jf", function()
				builtin.find_files({ no_ignore = true, hidden = true }) -- show dotfiles
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
					preview = { treesitter = true },
					color_devicons = true,
					sorting_strategy = "ascending",
					borderchars = {
						"", -- top
						"", -- right
						"", -- bottom
						"", -- left
						"", -- top-left
						"", -- top-right
						"", -- bottom-right
						"", -- bottom-left
					},
					path_displays = { "smart" },
					layout_config = {
						height = 100,
						width = 400,
						prompt_position = "top",
						preview_cutoff = 40,
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
