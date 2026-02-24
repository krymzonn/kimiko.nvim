local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@param p table Palette
---@param opts table
---@return table
function M.get(p, opts)
  local hl = {}
  local bg = p.bg2  -- uniform bg

  hl.BufferLineBackground        = { fg = p.fg_dim, bg = bg }
  hl.BufferLineBuffer            = { fg = p.fg_dim, bg = bg }
  hl.BufferLineBufferSelected    = { fg = p.active, bg = bg, bold = true }
  hl.BufferLineBufferVisible     = { fg = p.fg_dim, bg = bg }
  hl.BufferLineTab               = { fg = p.fg_dim, bg = bg }
  hl.BufferLineTabSelected       = { fg = p.active, bg = bg, bold = true }
  hl.BufferLineTabClose          = { fg = p.err, bg = bg }
  hl.BufferLineSeparator         = { fg = bg, bg = bg }  -- invisible
  hl.BufferLineSeparatorSelected = { fg = bg, bg = bg }
  hl.BufferLineModified          = { fg = p.warn, bg = bg }
  hl.BufferLineModifiedSelected  = { fg = p.warn, bg = bg }
  hl.BufferLineDuplicate         = { fg = p.fg_dim, bg = bg, italic = true }
  hl.BufferLineDuplicateSelected = { fg = p.fg_dim, bg = bg, italic = true }
  hl.BufferLineIndicatorSelected = { fg = p.succ, bg = bg }
  hl.BufferLineCloseButton       = { fg = p.err, bg = bg }
  hl.BufferLineCloseButtonSelected = { fg = p.err, bg = bg }
  hl.BufferLineFill              = { fg = bg, bg = bg }
  hl.BufferLinePick              = { fg = p.fg0, bg = bg }
  hl.BufferLinePickSelected      = { fg = p.fg0, bg = bg, bold = true }
  hl.BufferLineError             = { fg = p.err, bg = bg }
  hl.BufferLineErrorDiagnostic   = { fg = p.err, bg = bg }
  hl.BufferLineWarning           = { fg = p.warn, bg = bg }
  hl.BufferLineWarningDiagnostic = { fg = p.warn, bg = bg }
  hl.BufferLineInfo              = { fg = p.num, bg = bg }
  hl.BufferLineInfoDiagnostic    = { fg = p.num, bg = bg }
  hl.BufferLineHint              = { fg = p.fg_dim, bg = bg }
  hl.BufferLineHintDiagnostic    = { fg = p.fg_dim, bg = bg }
  hl.BufferLineTruncMarker       = { fg = p.fg_dim, bg = bg }

  -- Transparent override (if opts.transparent)
  for _, def in pairs(hl) do
    if def.bg and def.bg ~= "NONE" then
      def.bg = "NONE"
    end
  end

  return hl
end

return M
