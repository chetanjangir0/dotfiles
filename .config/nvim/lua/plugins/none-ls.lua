return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local has_eslint = function(utils)
			return utils.root_has_file({
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.json",
				"eslint.config.js",
				"eslint.config.cjs",
				"eslint.config.mjs",
			})
		end
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.nixfmt,
				require("none-ls.diagnostics.eslint").with{condition=has_eslint},
			},
		})
	end,
}
