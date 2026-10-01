local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Oxocarbon Dimmed
    -- "IBM Carbon workstation"
    ------------------------------------------------------------------

    local bg         = transparent and "NONE" or "#161616"
    local bg_alt     = "#1E1E1E"
    local bg_float   = "#1B1B1B"
    local bg_visual  = "#2A2A2A"

    local fg         = "#F2F4F8"
    local fg_alt     = "#DDE1E6"
    local fg_dim     = "#9EA4B0"

    local comment    = "#6F7680"
    local line_nr    = "#464C55"

    local separator  = "#282828"


    ------------------------------------------------------------------
    -- Oxocarbon palette with Dark Dimmed roles
    ------------------------------------------------------------------

    -- Functions / main accent
    local blue       = "#78A9FF"
    local blue_light = "#A6C8FF"


    -- Types / structures
    local cyan       = "#33B1FF"


    -- Keywords
    local purple     = "#BE95FF"


    -- Strings
    local green      = "#42BE65"


    -- Numbers / constants
    local orange     = "#FF9F43"


    -- Warnings
    local yellow     = "#F1C21B"


    -- Errors / TrackPoint
    local red        = "#FF7EB6"


    -- Modules / namespaces
    local steel      = "#8D99A8"



    ------------------------------------------------------------------

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



    ------------------------------------------------------------------
    -- UI
    ------------------------------------------------------------------

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


    hl("LineNr", {
        fg = line_nr
    })


    hl("CursorLineNr", {
        fg = blue_light,
        bold = true
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



    ------------------------------------------------------------------
    -- Vim syntax
    ------------------------------------------------------------------

    hl("Comment", {
        fg = comment,
        italic = true
    })


    hl("Identifier", {
        fg = fg
    })


    -- Functions

    hl("Function", {
        fg = blue
    })


    -- Keywords

    hl("Keyword", {
        fg = purple,
        bold = true
    })


    hl("Statement", {
        fg = purple
    })


    -- Types

    hl("Type", {
        fg = cyan
    })


    hl("StorageClass", {
        fg = purple
    })


    hl("Structure", {
        fg = cyan
    })


    -- Strings

    hl("String", {
        fg = green
    })


    hl("Character", {
        fg = green
    })


    -- Constants

    hl("Constant", {
        fg = orange
    })


    hl("Number", {
        fg = orange
    })


    hl("Boolean", {
        fg = orange
    })


    -- Operators

    hl("Operator", {
        fg = fg_alt
    })


    hl("Delimiter", {
        fg = fg_dim
    })



    ------------------------------------------------------------------
    -- Treesitter
    ------------------------------------------------------------------

    -- Modules

    hl("@module", {
        fg = steel
    })


    hl("@namespace", {
        fg = steel
    })


    -- Types

    hl("@type", {
        fg = cyan
    })


    hl("@type.builtin", {
        fg = cyan
    })


    -- Constructors

    hl("@constructor", {
        fg = blue_light
    })


    -- Functions

    hl("@function", {
        fg = blue
    })


    hl("@function.method", {
        fg = blue_light
    })


    hl("@method", {
        fg = blue_light
    })


    -- Variables

    hl("@variable", {
        fg = fg
    })


    hl("@variable.builtin", {
        fg = purple
    })


    -- Fields

    hl("@field", {
        fg = fg_alt
    })


    hl("@property", {
        fg = fg_alt
    })


    -- Parameters

    hl("@parameter", {
        fg = fg
    })


    -- Strings

    hl("@string", {
        fg = green
    })


    -- Numbers

    hl("@number", {
        fg = orange
    })


    hl("@boolean", {
        fg = orange
    })


    -- Comments

    hl("@comment", {
        fg = comment,
        italic = true
    })



    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search", {
        fg = bg,
        bg = yellow
    })


    hl("IncSearch", {
        fg = bg,
        bg = blue_light,
        bold = true
    })



    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------

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



    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    hl("Added", {
        fg = green
    })


    hl("Changed", {
        fg = blue
    })


    hl("Removed", {
        fg = red
    })



    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

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
