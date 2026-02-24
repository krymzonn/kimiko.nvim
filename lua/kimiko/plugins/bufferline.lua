local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@param p table Palette
---@param opts table
---@return table
function M.get(p, opts)
  local groups = {
    "background",
    "buffer", "buffer_selected", "buffer_visible",
    "close_button", "close_button_selected", "close_button_visible",
    "duplicate", "duplicate_selected", "duplicate_visible",
    "error", "error_diagnostic", "error_diagnostic_selected", "error_diagnostic_visible", "error_selected", "error_visible",
    "fill",
    "group_label", "group_separator",
    "hint", "hint_diagnostic", "hint_diagnostic_selected", "hint_diagnostic_visible", "hint_selected", "hint_visible",
    "indicator_selected", "indicator_visible",
    "info", "info_diagnostic", "info_diagnostic_selected", "info_diagnostic_visible", "info_selected", "info_visible",
    "modified", "modified_selected", "modified_visible",
    "numbers", "numbers_selected", "numbers_visible",
    "offset_separator",
    "pick", "pick_selected", "pick_visible",
    "separator", "separator_selected", "separator_visible",
    "tab", "tab_close", "tab_selected", "tab_separator", "tab_separator_selected",
    "trunc_marker",
    "warning", "warning_diagnostic", "warning_diagnostic_selected", "warning_diagnostic_visible", "warning_selected", "warning_visible",
  }

  local hl = {}
  local bg = p.bg2
  local fg = p.line  -- default uniform fg

  -- Set defaults
  for _, short in ipairs(groups) do
    local attrs = { fg = fg, bg = bg }
    if short:match("duplicate") then attrs.italic = true end
    if short:match("selected") and not short:match("separator") then attrs.bold = true end
    hl["BufferLine" .. short:gsub("_", function(c) return c:upper() end)] = attrs
  end

  -- Overrides (semantic pops)
  local overrides = {
    BufferLineBufferSelected = { fg = p.active },
    BufferLineTabSelected    = { fg = p.active },
    BufferLineCloseButton    = { fg = p.err },
    BufferLineCloseButtonSelected = { fg = p.err },
    BufferLineModified       = { fg = p.warn },
    BufferLineModifiedSelected = { fg = p.warn },
    BufferLineError          = { fg = p.err },
    BufferLineErrorDiagnostic = { fg = p.err },
    BufferLineWarning        = { fg = p.warn },
    BufferLineWarningDiagnostic = { fg = p.warn },
    BufferLineInfo           = { fg = p.num },
    BufferLineInfoDiagnostic = { fg = p.num },
    BufferLineHint           = { fg = p.fg_dim },
    BufferLineHintDiagnostic = { fg = p.fg_dim },
    BufferLineIndicatorSelected = { fg = p.succ },
    BufferLinePick           = { fg = p.fg0 },
    BufferLinePickSelected   = { fg = p.fg0 },
    BufferLineTruncMarker    = { fg = p.fg_dim },
    -- Invisible separators
    BufferLineSeparator      = { fg = bg },
    BufferLineSeparatorSelected = { fg = bg },
    BufferLineSeparatorVisible = { fg = bg },
    BufferLineOffsetSeparator = { fg = bg },
    BufferLineFill           = { fg = bg },
  }

  for group, attrs in pairs(overrides) do
    attrs.bg = bg
    hl[group] = attrs
  end

  -- Transparent
  if opts.transparent then
    for _, def in pairs(hl) do
      if def.bg and def.bg ~= "NONE" then def.bg = "NONE" end
    end
  end

  return hl
end

return M

