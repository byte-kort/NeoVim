-- ── lazy.nvim bootstrap ──────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ── Loading modules ────────────────────────────────────────────────
require("core.options")
require("core.keymaps")

-- ── Loading plugin ─────────────────────────────────────────────────
require("lazy").setup({
    spec = { { import = "plugins" } },
    ui = { border = "single" },
})

-- ── Theme loading ──────────────────────────────────────────────────
require("themes.carbonfox").apply({ transparent = true })
