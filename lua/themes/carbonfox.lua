local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Carbonfox
    -- Original Nightfox-inspired palette
    ------------------------------------------------------------------

    local bg         = transparent and "NONE" or "#161616"
    local bg_alt     = "#202020"
    local bg_float   = "#1B1B1B"
    local bg_visual  = "#2A2A2A"

    local fg         = "#F2F4F8"
    local fg_alt     = "#DDE1E6"
    local fg_dim     = "#9EA4B0"

    local comment    = "#7B848E"
    local line_nr    = "#525A63"

    local black      = "#262626"

    local blue       = "#78A9FF"
    local cyan       = "#33B1FF"
    local green      = "#42BE65"
    local yellow     = "#F1C21B"
    local orange     = "#FF9E64"
    local purple     = "#BE95FF"
    local red        = "#EE5396"

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

    hl("Normal",           { fg = fg, bg = bg })
    hl("NormalNC",         { fg = fg, bg = bg })
    hl("NormalFloat",      { fg = fg, bg = bg_float })

    hl("CursorLine",       { bg = bg_alt })
    hl("CursorColumn",     { bg = bg_alt })

    hl("LineNr",           { fg = line_nr })
    hl("CursorLineNr",     { fg = blue, bold = true })

    hl("ColorColumn",      { bg = bg_alt })

    hl("NotifyBackground", { fg = fd    })

    hl("Visual",           { bg = bg_visual })

    hl("StatusLine",       { fg = fg_alt, bg = bg_alt })
    hl("StatusLineNC",     { fg = comment, bg = bg_alt })

    hl("WinSeparator",     { fg = black })

    hl("FloatBorder",      { fg = black, bg = bg_float })

    hl("Pmenu",            { fg = fg, bg = bg_float })
    hl("PmenuSel",         { fg = bg, bg = blue })

    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = fg })

    hl("Function",        { fg = blue })

    hl("Keyword",         { fg = purple, bold = true })
    hl("Statement",       { fg = purple })

    hl("Type",            { fg = yellow })
    hl("StorageClass",    { fg = purple })
    hl("Structure",       { fg = yellow })

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

    hl("@comment",        { fg = comment, italic = true })

    hl("@variable",       { fg = fg })
    hl("@variable.builtin",{ fg = red })

    hl("@parameter",      { fg = fg })

    hl("@field",          { fg = fg_alt })
    hl("@property",       { fg = fg_alt })

    hl("@module",         { fg = blue })
    hl("@namespace",      { fg = blue })

    hl("@type",           { fg = yellow })
    hl("@type.builtin",   { fg = yellow })

    hl("@constructor",    { fg = yellow })

    hl("@function",       { fg = blue })
    hl("@function.method",{ fg = blue })
    hl("@method",         { fg = blue })

    hl("@keyword",        { fg = purple })

    hl("@string",         { fg = green })
    hl("@character",      { fg = green })

    hl("@number",         { fg = orange })
    hl("@boolean",        { fg = orange })

    hl("@operator",       { fg = fg_alt })

    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",          { fg = bg, bg = yellow })
    hl("IncSearch",       { fg = bg, bg = orange, bold = true })

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

    hl("MatchParen",      { fg = cyan, bold = true })

    hl("Title",           { fg = fg, bold = true })

    hl("ErrorMsg",        { fg = red })

end

return M
