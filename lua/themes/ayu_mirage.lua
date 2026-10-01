local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Ayu Mirage
    -- "Professional IDE on Linux"
    ------------------------------------------------------------------

    -- база     #202734
    -- потемнее #141921
    local bg         = transparent and "NONE" or "#202734"
    local bg_alt     = "#262E3A"
    local bg_float   = "#1A1F29"
    local bg_visual  = "#34404D"

    local fg         = "#CBCCC6"
    local fg_alt     = "#B8C0CC"
    local fg_dim     = "#707A8C"

    local comment    = "#697584"
    local line_nr    = "#4A5364"

    local black      = "#303744"


    ------------------------------------------------------------------
    -- Ayu Mirage palette
    ------------------------------------------------------------------

    local blue       = "#59C2FF"
    local blue_light = "#73D0FF"

    local cyan       = "#95E6CB"

    local green      = "#BAE67E"

    local yellow     = "#FFD580"

    local orange     = "#FFCC66"

    local purple     = "#D4BFFF"

    local red        = "#F28779"


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

    hl("Normal",          { fg = fg, bg = bg })
    hl("NormalNC",        { fg = fg, bg = bg })
    hl("NormalFloat",     { fg = fg, bg = bg_float })

    hl("CursorLine",      { bg = bg_alt })
    hl("CursorColumn",    { bg = bg_alt })

    hl("LineNr",          { fg = line_nr })
    hl("CursorLineNr",    { fg = blue_light, bold = true })

    hl("Visual",          { bg = bg_visual })

    hl("StatusLine",      { fg = fg_alt, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("WinSeparator",    { fg = black })

    hl("FloatBorder",     { fg = blue, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = blue })


    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = fg })


    -- Functions
    hl("Function",        { fg = blue_light })


    -- Keywords
    hl("Keyword",         { fg = purple, bold = true })
    hl("Statement",       { fg = blue })


    -- Types
    hl("Type",            { fg = cyan })
    hl("StorageClass",    { fg = purple })
    hl("Structure",       { fg = cyan })


    -- Data
    hl("String",          { fg = green })
    hl("Character",       { fg = green })

    hl("Constant",        { fg = orange })
    hl("Number",           { fg = orange })
    hl("Boolean",          { fg = yellow })


    -- Operators
    hl("Operator",        { fg = fg_alt })
    hl("Delimiter",       { fg = fg_dim })


    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",          { fg = bg, bg = yellow })
    hl("IncSearch",       { fg = bg, bg = blue_light, bold = true })


    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------

    hl("DiagnosticError", { fg = red })
    hl("DiagnosticWarn",  { fg = yellow })
    hl("DiagnosticInfo",  { fg = blue })
    hl("DiagnosticHint",  { fg = cyan })


    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    hl("Added",           { fg = green })
    hl("Changed",         { fg = blue })
    hl("Removed",         { fg = red })


    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    hl("Directory",       { fg = blue_light })

    hl("MatchParen",      { fg = cyan, bold = true })

    hl("Title",           { fg = fg, bold = true })

    hl("ErrorMsg",        { fg = red })

end

return M
