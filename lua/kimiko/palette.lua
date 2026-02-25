-- lua/kimiko/palette.lua
local M = {}

M.palette = {
  -- CORE BG SHADES (dark → light)
  b00       = "#000000",
  bg0       = "#080808", -- ColorColumn
  bg1       = "#0d1111", -- CursorLine
  bg2       = "#1d2121", -- CursorColumn
  bg3       = "#323030",

  -- CORE FG SHADES (bright → dim)
  fg0       = "#ffffff",
  fg1bri    = "#eaf4a0",
  fg1       = "#bad094", -- norm editable, tint
  fg2       = "#fcc1d6", -- htmlH2
  fg3       = "#7aa2f8", -- Pmenu, PmenuSel, htmlH3, 'change'
  fg4       = "#5f87af", -- NonText, SpecialKey, htmlH4
  h5        = "#d8bccc", -- htmlH5
  h6        = "#aaaaab", -- htmlH6
  line      = "#4e4e52", -- mid neutral
  fg_see    = "#fedece", -- StatusLineNC
  fg_read   = "#f8d1aa", -- main read-only

  -- ACCENT / SEMANTIC COLORS
  boom      = "#f8015d",
  warn      = "#fa9903", -- Conditional
  fine      = "#b2e878", -- th 'mint'
  good      = "#5df85d", -- th 'green'
  num       = "#aaaaf8",
  str       = "#f8aaf8",
  fn        = "#d1f8f8", -- Function, Identifier
  fgc       = "#aad1d1", -- Comment os dim
  op        = "#f85d84",
  kw        = "#f8d15d", -- Statement
  active    = "#d1f85d", -- 'cypher', active window/element

  -- UI / TAB / SEARCH / DIFF
  bg_match  = "#526600", -- MatchParen
  accent    = "#aa83f8",
  deep_inc  = "#670044", -- IncSearch
  bg_search = "#00686c", -- Search
  bg_vis    = "#063662", -- Visual, DiffText
  bg_chg    = "#232345", -- DiffChange
  bg_add    = "#1b3f00", -- DiffAdd
  bg_del    = "#4c1100", -- DiffDelete
}

return M
