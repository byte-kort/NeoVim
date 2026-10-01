return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    -- Убираем event, чтобы плагин гарантированно загрузился при старте Nvim
    -- Это решит проблему "module not found"
    build = ":TSUpdate",
    config = function()
        -- Убираем pcall, так как если плагин не найден, проблема в Lazy, 
        -- а не в нашем конфиге. Пусть лучше падает с ошибкой, чем молчит.
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "rust", "cpp", "go", "lua", "python", "vim", "vimdoc", "query", "bash" },
            auto_install = false, 
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<C-s>",
                    node_decremental = "<BS>",
                },
            },
        })
    end,
}
