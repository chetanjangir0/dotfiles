return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable({
        "nil_ls",
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "eslint",
        "marksman",
        "rust_analyzer",
        "gopls",
        "tinymist",
      })

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- default is gra
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>dm", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
      vim.keymap.set("n", "<leader>dl", require("telescope.builtin").diagnostics, { buffer = 0 })
      vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { buffer = 0 })


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
