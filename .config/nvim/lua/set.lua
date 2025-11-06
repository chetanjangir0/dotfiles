vim.g.mapleader = " " -- set leader key to space
vim.g.maplocalleader = "\\"
vim.opt.winborder = "rounded"

-- basic
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8 --  keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- keep 8 columns left/right to cursor

-- indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- number of spaces used when using >>
vim.opt.autoindent = true -- copy indent from current line
vim.opt.smartindent = true -- smart autoindent (eg after {, :, etc)

-- file handeling
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.updatetime = 50 -- shows faster lsp diagnostics after you stop typing

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false -- don't highlight search results
vim.opt.incsearch = true -- show matches as you type

-- visual settings
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- reserve space on left to display lsp etc signs
vim.opt.showmode = false -- don't show mode(visual, normal ..) in cmd line
vim.opt.pumheight = 10 -- maximum items in completion popup menu

