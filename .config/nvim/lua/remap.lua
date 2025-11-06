local map = vim.keymap.set

--copy and paste
map("n", "<Leader>y", '"+y', { noremap = true })
map("v", "<Leader>y", '"+y', { noremap = true })
map("n", "<Leader>p", '"+p', { noremap = true })
map("v", "<Leader>p", '"+p', { noremap = true })

--move lines up or down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection up" })

--edit all occurance of the word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--go to the other end of paranthesis
map("n", "<A-m>", "%", { noremap = true, silent = true })

-- better indenting in visual mode
map("v", "<", "<gv", { desc = "indent left and reselect" })
map("v", ">", ">gv", { desc = "indent right and reselect" })
