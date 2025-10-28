require("set")
require("remap")
require("config.lazy")

-- markdown text wrapping
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.textwidth = 80
	end,
})
