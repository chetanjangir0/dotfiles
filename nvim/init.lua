require("set")
require("remap")

require("config.lazy")
--syntax highlight for waybar config files
vim.filetype.add({
  pattern = {
    [".*/waybar/config"] = "jsonc",
  },
})

