local M = {}

function M.get(p)
  return {
    -- Core
    TelescopeNormal         = { fg = p.fg_read, bg = p.bg0 },           -- main bg/fg
    TelescopeBorder         = { fg = p.bg3, bg = p.bg0 },               -- outer frame
    TelescopeTitle          = { fg = p.bg1, bg = p.active, bold = true }, -- generic title

    -- Prompt
    TelescopePromptBorder   = { fg = p.bg2, bg = p.bg1 },  -- input frame
    TelescopePromptNormal   = { fg = p.fg1, bg = p.bg1 },  -- input bg/fg
    TelescopePromptTitle    = { fg = p.bg1, bg = p.good }, -- "Prompt" title
    TelescopePromptPrefix   = { fg = p.active, bg = p.bg1 }, -- > icon
    TelescopePromptCounter  = { fg = p.fg_see, bg = p.bg1 }, -- match count

    -- Results
    TelescopeResultsBorder  = { fg = p.bg3, bg = p.bg0 },            -- list frame
    TelescopeResultsNormal  = { fg = p.fg_read, bg = p.bg0 },        -- list bg/fg
    TelescopeResultsTitle   = { fg = p.bg1, bg = p.fn },             -- "Results" title
    TelescopeSelection      = { fg = p.fg1, bg = p.bg2, bold = true }, -- selected item
    TelescopeMatching       = { fg = p.accent, bold = true },        -- fuzzy matches

    -- Preview
    TelescopePreviewBorder  = { fg = p.bg3, bg = p.bg0 },   -- preview frame
    TelescopePreviewNormal  = { fg = p.fg_read, bg = p.bg0 }, -- preview bg/fg
    TelescopePreviewTitle   = { fg = p.bg1, bg = p.kw },    -- "Preview" title

    -- Multi-select
    TelescopeMultiSelection = { fg = p.good, bold = true }, -- selected markers
    TelescopeMultiIcon      = { fg = p.good },              -- + icons
  }
end

return M
