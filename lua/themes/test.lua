local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Palette
    ------------------------------------------------------------------

    local bg         = transparent and "NONE" or "#0F1316"
    local bg_alt     = "#14191D"
    local bg_float   = "#12171B"
    local bg_visual  = "#1E262C"

    local fg         = "#E6ECF2"
    local fg_alt     = "#CFD7E0"
    local fg_dim     = "#8A96A3"

    local comment    = "#616D78"
    local line_nr    = "#3A434C"

    local black      = "#22282E"

    -- Main accent: cold white / ice-infused crystal
    local blue       = "#E2F0F9"
    local cyan       = "#C5E3F6"

    -- Secondary accents: lighter, breathing, less saturated
    local green      = "#8BBFA4"
    local yellow     = "#D2BE82"
    local orange     = "#D49E82"
    local purple     = "#B8AEE2"
    local red        = "#D48888"

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
    hl("CursorLineNr",    { fg = blue, bold = true })

    hl("ColorColumn",     { bg = bg_alt })

    hl("Visual",          { bg = bg_visual })

    hl("StatusLine",      { fg = fg_alt, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("WinSeparator",    { fg = black })

    hl("FloatBorder",     { fg = cyan, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = blue })

    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = fg })

    hl("Function",        { fg = blue })

    hl("Keyword",         { fg = purple, bold = true })
    hl("Statement",       { fg = purple })

    hl("Type",            { fg = cyan })
    hl("StorageClass",    { fg = purple })
    hl("Structure",       { fg = cyan })

    hl("String",          { fg = green })
    hl("Character",       { fg = green })

    hl("Constant",        { fg = orange })
    hl("Number",          { fg = orange })
    hl("Boolean",         { fg = orange })

    hl("Operator",        { fg = fg_alt })
    hl("Delimiter",       { fg = fg_dim })

    ------------------------------------------------------------------
    -- Treesitter
    ------------------------------------------------------------------

    hl("@comment",          { fg = comment, italic = true })

    hl("@variable",           { fg = fg })
    hl("@variable.builtin", { fg = cyan })

    hl("@parameter",        { fg = fg })

    hl("@field",            { fg = fg_alt })
    hl("@property",         { fg = fg_alt })

    hl("@module",           { fg = blue })
    hl("@namespace",        { fg = blue })

    hl("@type",             { fg = cyan })
    hl("@type.builtin",     { fg = cyan })

    hl("@constructor",      { fg = cyan })

    hl("@function",         { fg = blue })
    hl("@function.method",  { fg = blue })
    hl("@method",           { fg = blue })

    hl("@keyword",          { fg = purple })

    hl("@string",           { fg = green })
    hl("@character",        { fg = green })

    hl("@number",           { fg = orange })
    hl("@boolean",          { fg = orange })

    hl("@operator",         { fg = fg_alt })

    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",          { fg = bg, bg = blue })
    hl("IncSearch",       { fg = bg, bg = cyan, bold = true })

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
    hl("Changed",         { fg = yellow })
    hl("Removed",         { fg = red })

    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    hl("Directory",       { fg = blue })

    hl("MatchParen",      { fg = blue, bold = true })

    hl("Title",           { fg = blue, bold = true })

    hl("ErrorMsg",        { fg = red })
end

return M
