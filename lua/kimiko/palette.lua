-- lua/kimiko/palette.lua
local M = {}

M.palette = {
  -- CORE BG SHADES (dark → light)
  b00       = "#000000", -- special cases only
  bg0       = "#0d0f0f", -- darkest base
  bg1       = "#1d1a1b", -- warmer
  bg2       = "#1d2121", -- 'standard'
  bg3       = "#323030", -- interface bars

  -- CORE FG SHADES (bright → dim)
  fg0       = "#ffffff", -- special cases only
  fg1bri    = "#eaf4a0", -- 'locked in' base
  fg1       = "#bad094", -- norm editable, tint
  fg2       = "#fcc1d6", -- htmlH2
  fg3       = "#8bb2d3", -- htmlH3, 'change'
  fg4       = "#5f87af", -- NonText, SpecialKey, htmlH4
  h5        = "#c7b7ca", -- htmlH5
  h6        = "#aaaaab", -- htmlH6
  line      = "#4e4e52", -- mid neutral
  fg_see    = "#fedece", -- emphasis read-only
  fg_read   = "#f8d1aa", -- main read-only

  -- ACCENT / SEMANTIC COLORS
  boom      = "#f8015d", -- attention
  warn      = "#fa9903", -- Conditional
  fine      = "#b2e878", -- th 'mint'
  good      = "#5df85d", -- th 'green'
  loop      = "#83f8f8", -- do for
  accent    = "#aa83f8",
  num       = "#aaaaf8",
  str       = "#f8aaf8",
  op        = "#f85d84", -- operator
  kw        = "#f8d15d", -- Keyword, Statement
  active    = "#d1f85d", -- 'cypher', active window/element
  fn        = "#d1f8f8", -- Function, Identifier
  fgc       = "#aad1d1", -- os dim

  -- UI / TAB / SEARCH / DIFF
  bg_match  = "#87004f", -- MatchParen
  deep_inc  = "#670044", -- IncSearch
  bg_del    = "#4c1100", -- DiffDelete
  bg_vis    = "#004f87", -- Visual
  bg_chg    = "#232345", -- DiffChange
  bg_search = "#3d6900", -- Search
  bg_add    = "#1b3f00", -- DiffAdd
}

return M
