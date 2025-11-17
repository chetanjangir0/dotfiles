return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local builtin = require("telescope.builtin")

			-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			local actions = require("telescope.actions")
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
					-- mappings = {
					-- 	i = { -- Insert mode mappings
					-- 		["<C-j>"] = actions.move_selection_next,
					-- 		["<C-k>"] = actions.move_selection_previous,
					-- 	},
					-- 	n = { -- Normal mode mappings (optional)
					-- 		["<C-j>"] = actions.move_selection_next,
					-- 		["<C-k>"] = actions.move_selection_previous,
					-- 	},
					-- },
          -- for files preview in side bar
					layout_config = {
						horizontal = {
							preview_cutoff = 0,
						},
					},
					file_ignore_patterns = { "node_modules/", ".git/" },
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
