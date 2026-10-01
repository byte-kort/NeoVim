local M = {}

function M.apply(opts)
    local transparent = opts and opts.transparent or false

    ------------------------------------------------------------------
    -- IBM Midnight
    -- "ThinkPad workstation in a server room"
    ------------------------------------------------------------------

    local bg          = transparent and "NONE" or "#101820"
    local bg_alt      = "#17232D"
    local bg_float    = "#131C24"
    local visual_bg   = "#263542"

    local fg          = "#D8DEE9"
    local fg_soft     = "#B8C3D0"
    local fg_dim      = "#697784"

    local comment     = "#586673"
    local line_nr     = "#36434E"


    ------------------------------------------------------------------
    -- IBM palette
    ------------------------------------------------------------------

    -- IBM blue
    local ibm_blue    = "#78A9FF"
    local blue_light  = "#A6C8FF"

    -- Deep blue metal
    local navy        = "#4589FF"
    local steel       = "#829AB1"

    -- Terminal green
    local green       = "#42BE65"

    -- Paper white
    local paper       = "#E0E0E0"

    -- Error LED
    local red         = "#FA4D56"


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

    hl("WinSeparator",    { fg = "#293641" })

    hl("StatusLine",      { fg = fg_soft, bg = bg_alt })
    hl("StatusLineNC",    { fg = comment, bg = bg_alt })

    hl("FloatBorder",     { fg = ibm_blue, bg = bg_float })

    hl("Pmenu",           { fg = fg, bg = bg_float })
    hl("PmenuSel",        { fg = bg, bg = ibm_blue })


    ------------------------------------------------------------------
    -- Syntax
    ------------------------------------------------------------------

    hl("Comment",         { fg = comment, italic = true })

    hl("Identifier",      { fg = paper })


    -- Functions
    hl("Function",        { fg = blue_light })


    -- Logic
    hl("Keyword",         { fg = ibm_blue, bold = true })
    hl("Statement",       { fg = navy })


    -- Types
    hl("Type",            { fg = steel })
    hl("StorageClass",    { fg = ibm_blue })
    hl("Structure",       { fg = navy })


    -- Data
    hl("String",          { fg = green })
    hl("Character",       { fg = green })

    hl("Constant",        { fg = paper })
    hl("Number",          { fg = blue_light })

    hl("Boolean",         { fg = ibm_blue })


    -- Operators
    hl("Operator",        { fg = fg_soft })
    hl("Delimiter",       { fg = fg_dim })


    ------------------------------------------------------------------
    -- Search
    ------------------------------------------------------------------

    hl("Search",          { fg = bg, bg = blue_light })
    hl("IncSearch",       { fg = bg, bg = ibm_blue, bold = true })


    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------

    hl("DiagnosticError", { fg = red })
    hl("DiagnosticWarn",  { fg = blue_light })
    hl("DiagnosticInfo",  { fg = ibm_blue })
    hl("DiagnosticHint",  { fg = steel })


    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    hl("Added",           { fg = green })
    hl("Changed",         { fg = ibm_blue })
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
