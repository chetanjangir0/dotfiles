return {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	opts = {
		debug = true,
		dependencies_bin = {
      -- because this plugins downloads its own tinymist which won't work on nixos 
      -- because the downloaded plugin will be dynamically linked
      -- websocat is fine because it is statically linked
			["tinymist"] = "tinymist", -- tells this plugin to use system's own tinymist
			["websocat"] = nil,
		},
	}, -- lazy.nvim will implicitly calls `setup {}`
}
