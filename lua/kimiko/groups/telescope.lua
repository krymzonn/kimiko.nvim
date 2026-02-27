local M = {}

function M.get(p)
  return {
    -- Core
    TelescopeNormal        = { fg = p.fg_read }, -- main bg/fg
    TelescopeBorder        = { fg = p.fn },      -- outer frame
    TelescopeTitle         = { fg = p.fn },      -- generic title

    ---- Prompt
    TelescopePromptBorder  = { fg = p.good }, -- input frame
    TelescopePromptNormal  = { fg = p.loop }, -- input bg/fg
    TelescopePromptTitle   = { fg = p.good }, -- "Prompt" title
    TelescopePromptPrefix  = { fg = p.good }, -- > icon
    TelescopePromptCounter = { fg = p.fgc },  -- match count

    ---- Results
    TelescopeResultsBorder = { fg = p.loop },             -- list frame
    TelescopeResultsNormal = { fg = p.fgc },              -- list bg/fg
    TelescopeMatching      = { fg = p.loop },             -- "Results" title
    TelescopeResultsTitle  = { fg = p.loop },             -- "Results" title
    TelescopeSelection     = { bg = p.good, fg = p.b00 }, -- selected item
    --TelescopeMatching       = { fg = p.accent, bold = true }, -- fuzzy matches

    ---- Preview
    TelescopePreviewTitle  = { fg = p.fg_see },  -- "Preview" title
    TelescopePreviewBorder = { fg = p.fg_see },  -- preview frame
    TelescopePreviewNormal = { fg = p.fg_read }, -- preview bg/fg

    ---- Multi-select
    --TelescopeMultiSelection = { fg = p.good, bold = true }, -- selected markers
    --TelescopeMultiIcon      = { fg = p.good },              -- + icons
    --["TelescopePromptBorder"] = { fg = p.bg2, bg = p.bg1 }
  }
end

return M
