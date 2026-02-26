local M = {}

function M.get(p)
  return {
    TelescopeBorder       = { fg = p.bg3, bg = p.bg0 },
    TelescopeNormal       = { fg = p.fg_read, bg = p.bg0 },
    TelescopePromptBorder = { fg = p.active, bg = p.bg1 },
    TelescopePromptNormal = { fg = p.fg1, bg = p.bg1 },
    TelescopeResultsTitle = { fg = p.bg1, bg = p.good },
    TelescopePreviewTitle = { fg = p.bg1, bg = p.fn },
    TelescopeSelection    = { bg = p.bg_search, fg = p.fn },
    -- etc. for Selection, Matching, MultiIcon
  }
end

return M
