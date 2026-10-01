local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Quantum
    --
    -- Dark graphite theme.
    -- Inspired by metal, concrete and industrial interfaces.
    ------------------------------------------------------------------

    local bg         = transparent and "NONE" or "#171717"
    local bg_alt     = "#202020"
    local bg_float   = "#171717"
    local bg_visual  = "#303030"

    local fg         = "#E1E1E1"
    local fg_alt     = "#BFC3C7"
    local fg_dim     = "#7D8288"

    local comment    = "#62666B"
    local line_nr    = "#464A4F"

    local black      = "#292929"

    ------------------------------------------------------------------
    -- Palette
    ------------------------------------------------------------------

    local steel      = "#7FA7C7" -- Functions
    local violet     = "#B49AC8" -- Keywords
    local graphite   = "#9FC3C0" -- Types
    local green      = "#91B58B" -- Strings
    local copper     = "#C69A6B" -- Numbers
    local red        = "#C77B7B" -- Errors
    local cyan       = "#78B7B7" -- Builtins / macros

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
    hl("CursorLineNr",    { fg = steel, bold = true })

    hl("ColorColumn",     { bg = bg_alt })

    hl("Visual",          { bg = bg_visual })

    hl("StatusLine",      { fg = fg_alt, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("WinSeparator",    { fg = black })

    hl("FloatBorder",     { fg = black, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = steel })

    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = fg })

    hl("Function",        { fg = steel })

    hl("Keyword",         { fg = violet, bold = true })
    hl("Statement",       { fg = violet })
    hl("StorageClass",    { fg = violet })

    hl("Type",            { fg = graphite })
    hl("Structure",       { fg = graphite })

    hl("String",          { fg = green })
    hl("Character",       { fg = green })

    hl("Constant",        { fg = copper })
    hl("Number",           { fg = copper })
    hl("Boolean",          { fg = copper })

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

    hl("@type",             { fg = graphite })
    hl("@type.builtin",     { fg = cyan })

    hl("@constructor",      { fg = fg })

    hl("@function",         { fg = steel })
    hl("@function.method",  { fg = steel })
    hl("@method",           { fg = steel })

    hl("@function.macro",   { fg = cyan })

    hl("@keyword",          { fg = violet })

    hl("@string",           { fg = green })
    hl("@character",        { fg = green })

    hl("@number",           { fg = copper })
    hl("@boolean",          { fg = copper })

    hl("@operator",         { fg = fg_alt })

    ------------------------------------------------------------------
    -- Rust Analyzer
    ------------------------------------------------------------------

    hl("@lsp.type.type",        { fg = graphite })
    hl("@lsp.type.struct",      { fg = graphite })
    hl("@lsp.type.class",       { fg = graphite })

    hl("@lsp.type.enum",        { fg = fg })
    hl("@lsp.type.enumMember",  { fg = fg })

    hl("@lsp.type.function",    { fg = steel })
    hl("@lsp.type.method",      { fg = steel })

    hl("@lsp.type.macro",       { fg = cyan })

    hl("@lsp.type.keyword",     { fg = violet })

    hl("@lsp.type.variable",    { fg = fg })
    hl("@lsp.type.parameter",   { fg = fg })

    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",        { fg = bg, bg = graphite })
    hl("IncSearch",     { fg = bg, bg = steel, bold = true })

    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------

    hl("DiagnosticError", { fg = red })
    hl("DiagnosticWarn",  { fg = copper })
    hl("DiagnosticInfo",  { fg = steel })
    hl("DiagnosticHint",  { fg = cyan })

    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    hl("Added",          { fg = green })
    hl("Changed",        { fg = steel })
    hl("Removed",        { fg = red })

    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    hl("Directory",      { fg = steel })

    hl("MatchParen",     { fg = cyan, bold = true })

    hl("Title",           { fg = fg, bold = true })

    hl("ErrorMsg",        { fg = red })

end

return M
