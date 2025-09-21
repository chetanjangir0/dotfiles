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
            end

            -- Configuration for LSP servers
            local lsps = {
                { "lua_ls" },
                { "ts_ls" },
                { "tailwindcss" },
                { "eslint" },
                { "marksman" },
                {
                    "rust_analyzer",
                    {
                        filetypes = { "rust" },
                        root_markers = { "Cargo.toml" },
                        settings = {
                            ["rust_analyzer"] = {
                                cargo = {
                                    allFeatures = true,
                                },
                            },
                        },
                    }
                },
                {
                    "gopls",
                    {
                        filetypes = { "go", "gomod", "gowork", "gotmpl" },
                        root_markers = { "go.work", "go.mod", ".git" },
                        settings = {
                            gopls = {
                                completeUnimported = true,
                                usePlaceholders = true,
                                analyses = {
                                    unusedparams = true,
                                },
                            },
                        },
                    }
                },
                {
                    "tinymist",
                    {
                        settings = {
                            formatterMode = "typstyle",
                            exportPdf = "never",
                        },
                    }
                },
            }

            -- Configure and enable LSP servers using the new API
            for _, lsp in pairs(lsps) do
                local name, config = lsp[1], lsp[2] or {}

                -- Set common config for all servers
                config.capabilities = capabilities
                config.on_attach = lsp_keymaps

                -- Configure the LSP server
                vim.lsp.config(name, config)

                -- Enable the LSP server
                vim.lsp.enable(name)
            end

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
