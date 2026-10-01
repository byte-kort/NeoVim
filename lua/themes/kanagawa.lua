local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- Kanagawa
    -- "Japanese ink, paper and moonlight"
    ------------------------------------------------------------------

    local bg          = transparent and "NONE" or "#1F1F28"
    local bg_alt      = "#16161D"
    local bg_float    = "#181820"
    local visual_bg   = "#2A2A37"

    local fg          = "#DCD7BA"
    local fg_soft     = "#C8C093"
    local fg_dim      = "#727169"

    local comment     = "#54546D"
    local line_nr     = "#3B3B4A"


    ------------------------------------------------------------------
    -- Kanagawa palette
    ------------------------------------------------------------------

    -- Wave blue
    local blue        = "#7E9CD8"
    local blue_light  = "#89B4FA"

    -- Green moss
    local green       = "#76946A"

    -- Cyan
    local cyan        = "#6A9589"

    -- Purple
    local purple      = "#957FB8"

    -- Paper
    local paper       = "#E6E5C4"

    -- Red
    local red         = "#C34043"

    -- Amber
    local amber       = "#DCA561"


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
    hl("CursorLineNr",    { fg = blue_light, bold = true })

    hl("LineNr",          { fg = line_nr })

    hl("Visual",          { bg = visual_bg })

    hl("WinSeparator",    { fg = "#363646" })

    hl("StatusLine",      { fg = fg_soft, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("FloatBorder",     { fg = blue, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = blue })


    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = paper })


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

    hl("Constant",        { fg = paper })
    hl("Number",          { fg = amber })

    hl("Boolean",         { fg = purple })


    -- Operators
    hl("Operator",        { fg = fg_soft })
    hl("Delimiter",       { fg = fg_dim })


    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",          { fg = bg, bg = amber })
    hl("IncSearch",       { fg = bg, bg = blue, bold = true })


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

    hl("Added",           { fg = green })
    hl("Changed",         { fg = blue })
    hl("Removed",         { fg = red })


    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    hl("Directory",       { fg = blue_light })

    hl("MatchParen",      { fg = paper, bold = true })

    hl("Title",            { fg = paper, bold = true })

    hl("ErrorMsg",         { fg = red })

end

return M
