return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Кастомная палитра для Neutral Dark
        local colors = {
            bg       = '#0D0F11',
            fg       = '#C0C5CE',
            blue     = '#8FA1B3',
            inactive = '#3D444A',
            red      = '#BF616A',
            green    = '#889B88'
        }

        local neutral_dark_theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
                b = { bg = colors.inactive, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg }
            },
            insert = {
                a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
            },
            visual = {
                a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
            },
            inactive = {
                a = { bg = colors.bg, fg = colors.inactive },
                b = { bg = colors.bg, fg = colors.inactive },
                c = { bg = colors.bg, fg = colors.inactive }
            }
        }

        require("lualine").setup({
            options = {
                theme = neutral_dark_theme,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff'},
                lualine_c = { 'filename' },
                lualine_x = { 'diagnostics', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end
}
