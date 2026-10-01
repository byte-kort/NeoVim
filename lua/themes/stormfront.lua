local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Rainroom
    -- "A heavy rain outside the window"
    ------------------------------------------------------------------

    local bg          = transparent and "NONE" or "#16191D"
    local bg_alt      = "#1C2026"
    local bg_float    = "#14171B"
    local visual_bg   = "#292F36"

    local fg          = "#C7CDD5"
    local fg_soft     = "#AAB2BC"
    local fg_dim      = "#69727D"

    local comment     = "#59616B"
    local line_nr     = "#394049"


    ------------------------------------------------------------------
    -- Rain palette
    ------------------------------------------------------------------

    local rain        = "#8FA9B8"
    local rain_light  = "#B2C7D3"

    local cloud       = "#7D8793"

    local asphalt     = "#68737D"

    local leaf        = "#87968B"

    local amber       = "#C7A77A"

    local warning     = "#C98282"


    ------------------------------------------------------------------
    -- Helper
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
    hl("CursorLineNr",    { fg = rain_light, bold = true })

    hl("LineNr",          { fg = line_nr })

    hl("Visual",          { bg = visual_bg })

    hl("WinSeparator",    { fg = "#252B31" })

    hl("StatusLine",      { fg = fg_soft, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("FloatBorder",     { fg = rain, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = rain })


    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })


    hl("Identifier",      { fg = fg })

    -- вода на стекле
    hl("Function",        { fg = rain_light })


    -- тучи
    hl("Keyword",         { fg = cloud, bold = true })
    hl("Statement",       { fg = cloud })


    -- мокрая растительность
    hl("Type",            { fg = leaf })
    hl("StorageClass",    { fg = rain })
    hl("Structure",       { fg = leaf })


    -- отражение света
    hl("String",          { fg = "#9AAE9E" })
    hl("Character",       { fg = "#9AAE9E" })


    hl("Constant",        { fg = amber })
    hl("Number",          { fg = "#B99A73" })
    hl("Boolean",         { fg = warning })


    hl("Operator",        { fg = fg_soft })
    hl("Delimiter",       { fg = fg_dim })


    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",          { fg = bg, bg = rain_light })
    hl("IncSearch",       { fg = bg, bg = rain, bold = true })


    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------

    hl("DiagnosticError", { fg = warning })
    hl("DiagnosticWarn",  { fg = amber })
    hl("DiagnosticInfo",  { fg = rain })
    hl("DiagnosticHint",  { fg = asphalt })


    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    hl("Added",           { fg = leaf })
    hl("Changed",         { fg = rain })
    hl("Removed",         { fg = warning })


    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    hl("Directory",       { fg = rain_light })

    hl("MatchParen",      { fg = rain_light, bold = true })

    hl("Title",            { fg = fg, bold = true })

    hl("ErrorMsg",         { fg = warning })

end

return M
