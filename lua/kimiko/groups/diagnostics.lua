local M = {}

function M.get(p)
  return {
    DiagnosticError            = { fg = p.boom },
    DiagnosticWarn             = { fg = p.warn },
    DiagnosticInfo             = { fg = p.fine },
    DiagnosticHint             = { fg = p.fg_see },
    DiagnosticOk               = { fg = p.good },

    DiagnosticSignError        = { fg = p.boom, bg = "NONE" },
    DiagnosticSignWarn         = { fg = p.warn, bg = "NONE" },
    DiagnosticSignInfo         = { fg = p.fine, bg = "NONE" },
    DiagnosticSignHint         = { fg = p.fg_see, bg = "NONE" },
    DiagnosticSignOk           = { fg = p.good, bg = "NONE" },

    DiagnosticVirtualTextError = { fg = p.boom, bg = p.bg1, italic = true },
    DiagnosticVirtualTextWarn  = { fg = p.warn, bg = p.bg1, italic = true },
    -- etc. for Info/Hint/Ok

    DiagnosticUnderlineError   = { undercurl = true, sp = p.err },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = p.warn },
    -- etc.
  }
end

return M
