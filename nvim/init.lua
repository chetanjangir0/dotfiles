vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8

require("config.lazy")

--syntax highlight for waybar config files
vim.filetype.add({
  pattern = {
    [".*/waybar/config"] = "jsonc",
  },
})


-- my remaps ---------------

--copy and paste
vim.keymap.set('n', '<Leader>y', '"+y', { noremap = true })
vim.keymap.set('v', '<Leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<Leader>p', '"+p', { noremap = true })
vim.keymap.set('v', '<Leader>p', '"+p', { noremap = true })

--move lines up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

--edit all occurance of the word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--go to the other end of paranthesis
vim.keymap.set('n', '<A-m>', '%', { noremap = true, silent = true })
