local map = vim.keymap.set

--copy and paste
map("n", "<Leader>y", '"+y', { noremap = true })
map("v", "<Leader>y", '"+y', { noremap = true })
map("n", "<Leader>p", '"+p', { noremap = true })
map("v", "<Leader>p", '"+p', { noremap = true })

--move lines up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

--edit all occurance of the word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--go to the other end of paranthesis
map("n", "<A-m>", "%", { noremap = true, silent = true })
