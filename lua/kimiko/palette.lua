-- lua/kimiko/palette.lua
local M = {}

M.palette = {
  -- CORE BG SHADES (dark → light)
  b00        = "#000000",
  bg0        = "#080808", -- ColorColumn
  bg1        = "#0d1111", -- CursorLine
  bg2        = "#1d2121", -- CursorColumn
  bg3        = "#323030",

  -- CORE FG SHADES (bright → dim)
  fg0        = "#ffffff",
  --fg1bri = "#eaf4a0",
  fg1        = "#bad094", -- norm editable, tint
  fg2        = "#eeeeee", -- Pmenu, PmenuSel, htmlH3
  fg3        = "#bfbebc", -- htmlH4, htmlH5
  fg4        = "#aaaaab", -- htmlH6
  line       = "#4e4e52", -- mid neutral
  fg_read    = "#f8d1aa",
  fg_see     = "#fedece", -- StatusLineNC

  -- ACCENT / SEMANTIC COLORS
  err        = "#f8015d",
  warn       = "#fa9903", -- Conditional
  fine       = "#b2e878", -- th mint
  type       = "#5df85d", -- th 'green'
  kw         = "#f8d15d", -- Statement
  op         = "#f85d84",
  str        = "#f8aaf8",
  num        = "#aaaaf8",
  fn         = "#d1f8f8", -- Function, Identifier
  title      = "#ff87af", -- Title, htmlH1
  fgc        = "#aad1d1", -- Comment os dim
  fg_h2      = "#ffdfdf", -- htmlH2

  -- UI / TAB / SEARCH / DIFF
  active     = "#d1f85d", -- 'cypher', active window/element
  bg_search  = "#005187", -- Search
  bg_add     = "#004406", -- DiffAdd
  bg_chg     = "#232345", -- DiffChange
  bg_del     = "#663230", -- DiffDelete
  ui_nontext = "#5f87af", -- NonText, SpecialKey
  deep_inc   = "#670044", -- IncSearch
  bg_match   = "#005f00", -- MatchParen
  bg_dtext   = "#343466", -- DiffText
}

return M
