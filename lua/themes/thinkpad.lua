local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- ThinkPad
    --
    -- Inspired by IBM engineering machines:
    -- matte black chassis, TrackPoint red accent,
    -- terminal screens and technical documentation.
    ------------------------------------------------------------------

    local bg         = transparent and "NONE" or "#111214"
    local bg_alt     = "#191B1E"
    local bg_float   = "#16181B"
    local bg_visual  = "#24282D"

    local fg         = "#D6D8DA"
    local fg_alt     = "#B7BBC0"
    local fg_dim     = "#777D84"

    local comment    = "#5E646B"
    local line_nr    = "#41464C"

    local black      = "#2A2D31"

    ------------------------------------------------------------------
    -- ThinkPad palette
    ------------------------------------------------------------------

    local blue       = "#7AA2C4" -- functions
    local red        = "#D15B61" -- keywords / TrackPoint accent
    local steel      = "#A8B7C4" -- types
    local green      = "#8FAE8B" -- strings
    local amber      = "#C8A96A" -- numbers
    local cyan       = "#79B7B7" -- builtins/macros

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
    hl("CursorLineNr",    { fg = red, bold = true })

    hl("ColorColumn",     { bg = bg_alt })

    hl("Visual",          { bg = bg_visual })

    hl("StatusLine",      { fg = fg_alt, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("WinSeparator",    { fg = black })

    hl("FloatBorder",     { fg = black, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = red })

    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = fg })

    hl("Function",        { fg = blue })

    hl("Keyword",         { fg = red, bold = true })
    hl("Statement",       { fg = red })
    hl("StorageClass",    { fg = red })

    hl("Type",            { fg = steel })
    hl("Structure",       { fg = steel })

    hl("String",          { fg = green })
    hl("Character",       { fg = green })

    hl("Constant",        { fg = amber })
    hl("Number",           { fg = amber })
    hl("Boolean",          { fg = amber })

    hl("Operator",        { fg = fg_alt })
    hl("Delimiter",       { fg = fg_dim })

    ------------------------------------------------------------------
    -- Treesitter
    ------------------------------------------------------------------

    hl("@comment",          { fg = comment, italic = true })

    hl("@variable",         { fg = fg })
    hl("@variable.builtin", { fg = cyan })

    hl("@parameter",        { fg = fg })

    hl("@field",            { fg = fg_alt })
    hl("@property",         { fg = fg_alt })

    hl("@module",           { fg = fg })
    hl("@namespace",        { fg = fg })

    hl("@type",             { fg = steel })
    hl("@type.builtin",     { fg = cyan })

    hl("@constructor",      { fg = steel })

    hl("@function",         { fg = blue })
    hl("@function.method",  { fg = blue })
    hl("@method",           { fg = blue })

    hl("@function.macro",   { fg = cyan })

    hl("@keyword",          { fg = red })

    hl("@string",           { fg = green })
    hl("@character",        { fg = green })

    hl("@number",           { fg = amber })
    hl("@boolean",          { fg = amber })

    hl("@operator",         { fg = fg_alt })

    ------------------------------------------------------------------
    -- Rust Analyzer
    ------------------------------------------------------------------

    hl("@lsp.type.type",        { fg = steel })
    hl("@lsp.type.struct",      { fg = steel })
    hl("@lsp.type.class",       { fg = steel })

    hl("@lsp.type.enum",        { fg = steel })
    hl("@lsp.type.enumMember",  { fg = fg })

    hl("@lsp.type.function",    { fg = blue })
    hl("@lsp.type.method",      { fg = blue })

    hl("@lsp.type.macro",       { fg = cyan })

    hl("@lsp.type.keyword",     { fg = red })

    hl("@lsp.type.variable",    { fg = fg })
    hl("@lsp.type.parameter",   { fg = fg })

    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",        { fg = bg, bg = amber })
    hl("IncSearch",     { fg = bg, bg = red, bold = true })

    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------

    hl("DiagnosticError", { fg = red })
    hl("DiagnosticWarn",  { fg = amber })
    hl("DiagnosticInfo",  { fg = blue })
    hl("DiagnosticHint",  { fg = cyan })

    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    hl("Added",          { fg = green })
    hl("Changed",        { fg = blue })
    hl("Removed",        { fg = red })

    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    hl("Directory",      { fg = blue })

    hl("MatchParen",     { fg = red, bold = true })

    hl("Title",          { fg = fg, bold = true })

    hl("ErrorMsg",       { fg = red })

end

return M
