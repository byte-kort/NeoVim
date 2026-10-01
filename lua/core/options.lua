-- ── options ──────────────────────────────────────────────────────────
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.signcolumn     = "yes"
vim.opt.scrolloff      = 8
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.wrap           = false
vim.opt.termguicolors  = true
vim.opt.showmode       = false
vim.opt.laststatus     = 0
vim.opt.cmdheight      = 1
vim.opt.updatetime     = 250

vim.diagnostic.config({
    virtual_text = true,   -- ошибки прямо в строке
    signs = true,          -- маркеры слева
    underline = true,      -- подчёркивание ошибки
    update_in_insert = false,
    severity_sort = true,
})
-- ──────────────────────────────────────────────────────────────────────
