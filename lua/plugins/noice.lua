return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            -- -- Блокируем надоедливые уведомления
            -- routes = {
            --     {
            --         filter = {
            --             event = "notify",
            --             find = "rust_analyzer: -32802",
            --         },
            --         opts = { skip = true },
            --     },
            --     {
            --         filter = {
            --             event = "msg_show",
            --             find = "server_request: no handler found for",
            --         },
            --         opts = { skip = true },
            --     },
            -- },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
            views = {
                cmdline_popup = {
                    border = { style = "single" },
                    win_options = {
                        winhighlight = {
                            Normal = "NormalFloat",
                            FloatBorder = "FloatBorder",
                        },
                    },
                },
                popup = {
                    border = { style = "single" },
                    win_options = {
                        winhighlight = {
                            Normal = "NormalFloat",
                            FloatBorder = "FloatBorder",
                        },
                    },
                },
            },
        })
    end
}
