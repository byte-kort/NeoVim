-- ── keymaps ──────────────────────────────────────────────────────────
vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<leader>e", ":Neotree toggle<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
-- LSP
map("n", "gd",         vim.lsp.buf.definition)
map("n", "K",          vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "[d",         vim.diagnostic.goto_prev)
map("n", "]d",         vim.diagnostic.goto_next)
-- ─────────────────────────────────────────────────────────────────────
