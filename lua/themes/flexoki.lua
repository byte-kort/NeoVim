local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Flexoki Dark
    -- "Minimal Unix notebook"
    ------------------------------------------------------------------

    local bg         = transparent and "NONE" or "#100F0F"
    local bg_alt     = "#1C1B1A"
    local bg_float   = "#151413"
    local bg_visual  = "#292724"

    local fg         = "#CECDC3"
    local fg_alt     = "#B7B5AC"
    local fg_dim     = "#878580"

    local comment    = "#6F6E69"
    local line_nr    = "#575653"

    local black      = "#282726"


    ------------------------------------------------------------------
    -- Flexoki palette
    ------------------------------------------------------------------

    local red        = "#AF3029"
    local red_light  = "#D14D41"

    local orange     = "#BC5215"

    local yellow     = "#AD8301"

    local green      = "#66800B"

    local cyan       = "#24837B"

    local blue       = "#205EA6"
    local blue_light = "#4385BE"

    local purple     = "#5E409D"


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
    hl("CursorLineNr",    { fg = red_light, bold = true })

    hl("Visual",          { bg = bg_visual })

    hl("StatusLine",      { fg = fg_alt, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("WinSeparator",    { fg = black })

    hl("FloatBorder",     { fg = red_light, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = red_light })


    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = fg })


    -- Functions
    hl("Function",        { fg = blue_light })


    -- Keywords
    hl("Keyword",         { fg = red_light, bold = true })
    hl("Statement",       { fg = red_light })


    -- Types
    hl("Type",            { fg = blue })
    hl("StorageClass",    { fg = purple })
    hl("Structure",       { fg = blue })


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
    hl("IncSearch",       { fg = bg, bg = red_light, bold = true })


    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------

    hl("DiagnosticError", { fg = red_light })
    hl("DiagnosticWarn",  { fg = yellow })
    hl("DiagnosticInfo",  { fg = blue_light })
    hl("DiagnosticHint",  { fg = cyan })


    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    hl("Added",           { fg = green })
    hl("Changed",         { fg = blue_light })
    hl("Removed",         { fg = red_light })


    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    hl("Directory",       { fg = blue_light })

    hl("MatchParen",      { fg = cyan, bold = true })

    hl("Title",           { fg = fg, bold = true })

    hl("ErrorMsg",        { fg = red_light })

end

return M
