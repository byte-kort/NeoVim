-- lua/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local caps = require("cmp_nvim_lsp").default_capabilities()

        -- Python
        lspconfig.basedpyright.setup({
            capabilities = caps,
            settings = {
                basedpyright = {
                    analysis = {
                        typeCheckingMode = "basic",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })
    end,
}
