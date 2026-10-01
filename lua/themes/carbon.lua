local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    local bg         = transparent and "NONE" or "#161616"
    local bg_alt     = "#202020"
    local bg_float   = "#1B1B1B"
    local bg_visual  = "#2A2A2A"

    local fg         = "#F4F4F4"
    local fg_alt     = "#D8D8D8"
    local fg_dim     = "#9EA4B0"

    local comment    = "#6F7680"
    local line_nr    = "#464C55"

    local separator  = "#303030"

    -- Carbon Graphite palette

    -- local blue       = "#78A9FF"
    -- local blue_light = "#A6C8FF"
    --
    -- local cyan       = "#6EA8C9"
    --
    -- local purple     = "#B39DDB"
    --
    -- local green      = "#7FB685"
    --
    -- local amber      = "#D8B365"
    --
    -- local yellow     = "#E3C567"
    --
    -- local red        = "#FF8389"
    --
    -- local steel      = "#A8B2BD"

    local blue       = "#78aaff" -- Классический оттенок, близкий к оригиналу
    local blue_light = "#96c0ff" -- Более мягкий, не такой «электрический»

    local cyan       = "#82cfff" -- Сделал чуть холоднее и светлее, в стиле темных тем

    local purple     = "#be95ff" -- Мягкий, глубокий фиолетовый

    local green      = "#a9dc76" -- Характерный для этой эстетики «травяной» оттенок

    local amber      = "#e6c384" -- Приглушенный теплый тон, без излишней желтизны

    local yellow     = "#f0d575" -- Мягкий, пастельный желтый

    local red        = "#ff7e93" -- «Пыльный» красный, меньше агрессии, больше стиля

    local steel      = "#aeb9c4" -- Нейтральный, сбалансированный серый

    local function hl(group, val)
        local cmd = string.format(
            "highlight! %s guifg=%s guibg=%s",
            group,
            val.fg or "NONE",
            val.bg or "NONE"
        )

        if val.bold then
            cmd = cmd .. " gui=bold"
        elseif val.italic then
            cmd = cmd .. " gui=italic"
        end

        vim.cmd(cmd)
    end


    -- UI

    hl("Normal", {
        fg = fg,
        bg = bg
    })

    hl("NormalNC", {
        fg = fg,
        bg = bg
    })

    hl("NormalFloat", {
        fg = fg,
        bg = bg_float
    })


    hl("CursorLine", {
        bg = bg_alt
    })

    hl("CursorColumn", {
        bg = bg_alt
    })


    hl("LineNr", {
        fg = line_nr
    })

    hl("CursorLineNr", {
        fg = blue_light,
        bold = true
    })


    hl("ColorColumn", {
        bg = bg_alt
    })


    hl("Visual", {
        bg = bg_visual
    })


    hl("StatusLine", {
        fg = fg_alt,
        bg = bg_alt
    })


    hl("StatusLineNC", {
        fg = comment,
        bg = bg_alt
    })


    hl("WinSeparator", {
        fg = separator
    })


    hl("FloatBorder", {
        fg = steel,
        bg = bg_float
    })


    hl("Pmenu", {
        fg = fg,
        bg = bg_float
    })


    hl("PmenuSel", {
        fg = bg,
        bg = blue
    })



    -- Syntax

    hl("Comment", {
        fg = comment,
        italic = true
    })


    hl("Identifier", {
        fg = fg
    })


    -- functions

    hl("Function", {
        fg = blue
    })


    -- keywords

    hl("Keyword", {
        fg = purple,
        bold = true
    })

    hl("Statement", {
        fg = purple
    })


    -- types

    hl("Type", {
        fg = fg
    })

    hl("StorageClass", {
        fg = purple
    })

    hl("Structure", {
        fg = fg
    })


    -- strings

    hl("String", {
        fg = green
    })

    hl("Character", {
        fg = green
    })


    -- constants

    hl("Constant", {
        fg = amber
    })

    hl("Number", {
        fg = amber
    })

    hl("Boolean", {
        fg = amber
    })


    hl("Operator", {
        fg = fg_alt
    })


    hl("Delimiter", {
        fg = fg_dim
    })



    -- Treesitter

    hl("@comment", {
        fg = comment,
        italic = true
    })


    hl("@variable", {
        fg = fg
    })


    hl("@variable.builtin", {
        fg = blue_light
    })


    hl("@parameter", {
        fg = fg
    })


    hl("@field", {
        fg = fg_alt
    })


    hl("@property", {
        fg = fg_alt
    })


    hl("@module", {
        fg = steel
    })


    hl("@namespace", {
        fg = steel
    })

    hl("@type", {
        fg = fg
    })


    hl("@type.builtin", {
        fg = fg
    })


    hl("@constructor", {
        fg = fg
    })


    hl("@function", {
        fg = blue
    })


    hl("@function.method", {
        fg = blue
    })


    hl("@method", {
        fg = blue
    })


    -- builtin functions / macros
    -- println!, Vec::new(), etc.

    hl("@function.builtin", {
        fg = blue_light
    })


    hl("@function.macro", {
        fg = steel
    })

    hl("@macro", {
        fg = blue_light
    })
    
    hl("@constant.macro", {
        fg = blue_light
    })

    hl("@keyword", {
        fg = purple
    })


    hl("@string", {
        fg = green
    })


    hl("@character", {
        fg = green
    })


    hl("@number", {
        fg = amber
    })


    hl("@boolean", {
        fg = amber
    })


    hl("@operator", {
        fg = fg_alt
    })

    -- hl("@constant", {
    --     fg = fg_alt
    -- })
    --
    -- hl("@constructor", {
    --     fg = fg
    -- })

    -- Search

    hl("Search", {
        fg = bg,
        bg = yellow
    })


    hl("IncSearch", {
        fg = bg,
        bg = blue_light,
        bold = true
    })



    -- Diagnostics

    hl("DiagnosticError", {
        fg = red
    })


    hl("DiagnosticWarn", {
        fg = yellow
    })


    hl("DiagnosticInfo", {
        fg = blue
    })


    hl("DiagnosticHint", {
        fg = cyan
    })



    -- Git

    hl("Added", {
        fg = green
    })


    hl("Changed", {
        fg = blue
    })


    hl("Removed", {
        fg = red
    })



    -- Misc

    hl("Directory", {
        fg = blue_light
    })


    hl("MatchParen", {
        fg = cyan,
        bold = true
    })


    hl("Title", {
        fg = fg,
        bold = true
    })


    hl("ErrorMsg", {
        fg = red
    })

end

return M
