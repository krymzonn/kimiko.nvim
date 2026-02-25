-- lua/kimiko/palette.lua
local M = {}

M.palette = {
  -- CORE BG SHADES (dark → light)
  bg0        = "#080808", -- ColorColumn
  bg1        = "#1c1c1c", -- CursorLine
  bg2        = "#262626", -- CursorColumn
  bg3        = "#323030",
  bg4        = "#4e4e52",

  -- CORE FG SHADES (bright → dim)
  fg0        = "#ffffff",
  --fg1bri = "#eaf4a0",
  fg1        = "#bad094", -- norm editable, tint
  fg2        = "#eeeeee", -- Pmenu, PmenuSel, htmlH3
  fg3        = "#bfbebc", -- htmlH4, htmlH5
  fg4        = "#aaaaab", -- htmlH6
  line       = "#6c6c6c", -- VertSplit, WinSeparator
  fg_dim     = "#3a3a3a", -- ModeMsg, MoreMsg
  fg_read    = "#f8d1aa",
  fg_see     = "#fedece", -- StatusLineNC

  -- ACCENT / SEMANTIC COLORS
  err        = "#ff005f",
  warn       = "#fa9903", -- Conditional
  succ       = "#87ffaf",
  type       = "#5fff5f",
  kw         = "#ffd65e", -- Statement
  op         = "#ff4f81",
  str        = "#ffafff",
  num        = "#afaffe",
  fn         = "#dfefff", -- Function, Identifier
  title      = "#ff87af", -- Title, htmlH1
  fgc        = "#aed7d7", -- Comment
  fg_h2      = "#ffdfdf", -- htmlH2

  -- UI / TAB / SEARCH / DIFF
  active     = "#d1f85d", -- 'cypher', active window/element
  good       = "#5df85d", -- 'green' os theme
  bg_search  = "#005187", -- Search
  bg_add     = "#004406", -- DiffAdd
  bg_chg     = "#232345", -- DiffChange
  bg_del     = "#663230", -- DiffDelete
  ui_nontext = "#5f87af", -- NonText, SpecialKey
  fg_inc     = "#670044", -- IncSearch
  bg_inc     = "#8aff04", -- IncSearch
  bg_match   = "#005f00", -- MatchParen
  bg_dtext   = "#343466", -- DiffText
}

return M
