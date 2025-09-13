return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"rust_analyzer",
					"gopls",
					"tinymist",
                    "tailwindcss",
                    "eslint",
                    "marksman"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig/util")

			local lsp_keymaps = function()
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
				vim.keymap.set(
					"n",
					"<leader>dm",
					vim.diagnostic.open_float,
					{ desc = "Open floating diagnostic message" }
				)

				vim.keymap.set("n", "<leader>dl", require("telescope.builtin").diagnostics, { buffer = 0 })
				vim.keymap.set("n", "<leader>rf", require("telescope.builtin").lsp_references, { buffer = 0 })
				-- vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
				-- vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
			end

			local lspconfig = require("lspconfig")

            local servers = {"lua_ls", "ts_ls", "tailwindcss", "eslint", "marksman"}
            for _,lsp in ipairs(servers) do
                lspconfig[lsp].setup{
                    capabilities = capabilities,
                    on_attach = lsp_keymaps,
                }
            end

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
                on_attach = lsp_keymaps,
				filetypes = { "rust" },
				root_dir = util.root_pattern("Cargo.toml"),
				settings = {
					["rust_analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
                on_attach = lsp_keymaps,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})
			lspconfig.tinymist.setup({
				capabilities = capabilities,
                on_attach = lsp_keymaps,
				settings = {
					formatterMode = "typstyle",
					exportPdf = "never",
				},
			})

			-- Configure built-in diagnostic display
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- Or any character you like
				},
				update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
