local M = {}

function M.get(p)
  return {
    StatusLine           = { fg = p.fg_see, bg = p.bg3 },
    StatusLineNC         = { fg = p.fg_read, bg = p.bg3 },
    VertSplit            = { fg = p.bg3 },
    Search               = { bg = p.bg_search, underline = true },
    IncSearch            = { fg = p.deep_inc, bg = p.active },
    Visual               = { bg = p.bg_vis },
    MatchParen           = { bg = p.bg_match },
    TabLine              = { fg = p.h6, bg = p.bg1 },
    TabLineFill          = { fg = p.line, bg = p.bg1 },
    TabLineSel           = { fg = p.fg_read, bg = p.bg2 },
    WinBar               = { fg = p.fg_read, bg = p.bg3 },
    WinBarNC             = { fg = p.line, bg = p.bg0 },

    LineNr               = { fg = p.line },
    CursorLineNr         = { bg = p.bg1, fg = p.h5 },
    LineNrAbove          = { fg = p.line },
    LineNrBelow          = { fg = p.line },
    CursorLine           = { bg = p.bg1 },
    CursorColumn         = { bg = p.bg3 },
    ColorColumn          = { bg = p.bg1 },
    SignColumn           = { fg = p.fg_see },
    CursorLineSign       = { fg = p.fg2 },
    FoldColumn           = { fg = p.h5 },
    CursorLineFold       = { fg = p.active },
    Folded               = { bg = p.line },

    GitSignsAdd          = { fg = p.fine },
    GitSignsChange       = { fg = p.fg4 },
    GitSignsDelete       = { fg = p.op },
    GitSignsChangedelete = { fg = p.warn }, -- mixed
    GitSignsTopdelete    = { fg = p.boom },
    GitSignsUntracked    = { fg = p.h6 },

    NormalFloat          = { fg = p.fg_see, bg = p.bg1 }, -- subtle bg lift
    FloatBorder          = { fg = p.bg3, bg = p.bg1 },
    FloatTitle           = { fg = p.fg2 },
    FloatShadow          = { bg = p.line },
    FloatShadowThrough   = { bg = p.bg0 },

    LazyButton           = { bg = p.bg2, fg = p.h5 },
    LazySpecial          = { fg = p.fn },
    --LazySpecial          = { fg = p.fn },
    --LazyComment          = { fg = p.h5 },


    --Pmenu         = { fg = p.fg1, bg = p.b00 },
    --PmenuSel      = { fg = p.b00, bg = p.good },
    --PmenuMatch    = { fg = p.loop, bg = p.b00 },
    --PmenuMatchSel = { fg = p.bg_vis, bg = p.good },
    --PmenuKind     = { fg = p.fg3, bg = p.b00 },
    --PmenuKindSel  = { fg = p.bg_chg, bg = p.good },


    Pmenu         = { bg = p.line },
    PmenuSel      = { bg = p.bg_add },
    PmenuMatch    = { fg = p.num, bg = p.line },
    PmenuMatchSel = { fg = p.accent, bg = p.bg_add },
    PmenuKind     = { fg = p.fg4 },
    PmenuKindSel  = { bg = p.bg_add },
    PmenuExtra    = { bg = p.line },
    PmenuExtraSel = { bg = p.bg_add },
    PmenuSbar     = { bg = p.bg3 },
    PmenuThumb    = { bg = p.line },
    ComplMatchIns = { fg = p.accent },


    ---BlinkCmpMenu          = { fg = p.fg_read, bg = p.line },
    --BlinkCmpMenuBorder    = { fg = p.bg3, bg = p.bg1 },
    ---BlinkCmpMenuSelection = { fg = p.b00, bg = p.good },

    -- -- Labels
    -- BlinkCmpLabel           = { fg = p.fg1 },
    -- BlinkCmpLabelDeprecated = { fg = p.fg_see, strikethrough = true },
    -- BlinkCmpLabelMatch      = { fg = p.accent, bold = true },

    -- -- Kinds (default + per-kind)
    -- BlinkCmpKind            = { fg = p.kw },
    -- BlinkCmpKindText        = { fg = p.str },
    -- BlinkCmpKindVariable    = { fg = p.fg1 },
    -- BlinkCmpKindFunction    = { fg = p.fn },
    -- BlinkCmpKindMethod      = { fg = p.fn },
    -- BlinkCmpKindConstant    = { fg = p.num },
    -- BlinkCmpKindClass       = { fg = p.good },
    -- BlinkCmpKindInterface   = { fg = p.good },
    -- BlinkCmpKindModule      = { fg = p.kw },
    -- BlinkCmpKindProperty    = { fg = p.fg3 },
    -- BlinkCmpKindKeyword     = { fg = p.kw },
    -- BlinkCmpKindFile        = { fg = p.fine },

    -- -- Selected kinds (recent addition)
    -- BlinkCmpKindSel         = { fg = p.active, bold = true },
    -- -- Add per-kind Sel if needed: BlinkCmpKindFunctionSel = { ... }

    -- -- Docs/Signature
    -- BlinkCmpDoc             = { fg = p.fg_read, bg = p.bg0 },
    -- BlinkCmpDocBorder       = { fg = p.bg3, bg = p.bg0 },
    -- BlinkCmpSignature       = { fg = p.fg1, bg = p.bg1 },
    -- BlinkCmpSignatureBorder = { fg = p.bg3, bg = p.bg1 },

    -- -- Source (bottom)
    -- BlinkCmpSource          = { fg = p.fg_see, bg = p.bg1 },

    --IndentBlanklineContextChar = { fg = p.h5 }
  }
end

return M
