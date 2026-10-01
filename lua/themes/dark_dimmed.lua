local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- GitHub Dark Dimmed Workstation
    -- "ThinkPad developer environment"
    ------------------------------------------------------------------
    
    -- #161616
    -- #22272E
    local bg         = transparent and "NONE" or "#22272E"
    local bg_alt     = "#2D333B"
    local bg_float   = "#24292F"
    local bg_visual  = "#373E47"

    local fg         = "#ADBAC7"
    local fg_alt     = "#C5D1DE"
    local fg_dim     = "#768390"

    local comment    = "#768390"
    local line_nr    = "#545D68"

    local black      = "#1C2128"


    ------------------------------------------------------------------
    -- GitHub Dark Dimmed palette
    ------------------------------------------------------------------

    local blue       = "#539BF5"
    local blue_light = "#6CB6FF"

    local cyan       = "#56D4DD"

    local green      = "#57AB5A"

    local orange     = "#C69026"

    local yellow     = "#D4A72C"

    local purple     = "#B083F0"

    local red        = "#E5534B"


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
    -- Classic groups
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = fg })


    hl("Function",        { fg = blue_light })

    hl("Keyword",         { fg = purple, bold = true })
    hl("Statement",       { fg = purple })

    hl("Type",            { fg = cyan })

    hl("StorageClass",    { fg = purple })
    hl("Structure",       { fg = cyan })


    hl("String",          { fg = green })
    hl("Character",       { fg = green })

    hl("Constant",        { fg = orange })
    hl("Number",           { fg = orange })
    hl("Boolean",          { fg = orange })


    hl("Operator",        { fg = fg_alt })
    hl("Delimiter",       { fg = fg_dim })


    ------------------------------------------------------------------
    -- Treesitter
    ------------------------------------------------------------------

    hl("@module",         { fg = fg_dim })

    hl("@namespace",      { fg = fg_dim })

    hl("@type",           { fg = cyan })

    hl("@constructor",    { fg = blue_light })

    hl("@function",       { fg = blue_light })

    hl("@function.method",{ fg = blue })

    hl("@variable",       { fg = fg })

    hl("@field",          { fg = fg_alt })

    hl("@property",       { fg = fg_alt })

    hl("@parameter",      { fg = fg })


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

    hl("Title",            { fg = fg_alt, bold = true })

    hl("ErrorMsg",         { fg = red })

end

return M
