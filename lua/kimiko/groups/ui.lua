local M = {}

function M.get(p)
  return {
    Pmenu                = { fg = p.line, bg = p.bg2 },
    PmenuSel             = { fg = p.fg3, bg = p.bg_sel },
    StatusLine           = { fg = p.fg_read, bg = p.bg3 },
    StatusLineNC         = { fg = p.fg_see, bg = p.bg3 },
    VertSplit            = { fg = p.line, bg = p.bg3 },
    Search               = { bg = p.bg_search, underline = true },
    IncSearch            = { fg = p.deep_inc, bg = p.active },
    Visual               = { bg = p.bg_vis },
    MatchParen           = { bg = p.bg_match },
    TabLine              = { fg = p.line, bg = p.bg3 },
    TabLineFill          = { fg = p.line, bg = p.bg2 },
    TabLineSel           = { fg = p.line, bg = p.bg2 },
    WinBar               = { fg = p.line, bg = p.bg3 },
    WinBarNC             = { fg = p.line, bg = p.bg3 },

    LineNr               = { fg = p.line },
    CursorLineNr         = { bg = p.b00, fg = p.h5 },
    LineNrAbove          = { fg = p.line },
    LineNrBelow          = { fg = p.line },
    CursorLine           = { bg = p.b00 },
    CursorColumn         = { bg = p.bg1 },
    ColorColumn          = { bg = p.bg0 },
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


    --IndentBlanklineContextChar = { fg = p.h5 }
  }
end

return M
