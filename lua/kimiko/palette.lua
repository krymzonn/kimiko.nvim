-- lua/kimiko/palette.lua
local M = {}

M.palette = {
  -- CORE BG SHADES (dark → light)
  bg0           = "#080808", -- ColorColumn
  bg1           = "#1c1c1c", -- CursorLine
  --bg1         = "#fc1c1c", -- CursorLine
  bg2           = "#262626", -- CursorColumn
  bg3           = "#323030", -- Pmenu

  -- CORE FG SHADES (bright → dim)
  fg0           = "#ffffff",
  --fg1 = "#eaf4a0",
  fg1           = "#bad094",
  --fg1         = "#ba0094",
  fg2           = "#eeeeee", -- Pmenu, PmenuSel, htmlH3
  fg3           = "#bcbcbc", -- htmlH4, htmlH5
  fg4           = "#d0d0d0", -- htmlH6
  line          = "#bfbebc", -- LineNr
  fg_dim        = "#3a3a3a", -- ModeMsg, MoreMsg
  fgc           = "#aed7d7", -- Comment

  -- ACCENT / SEMANTIC COLORS
  err           = "#ff005f",
  warn          = "#fa9903", -- Conditional
  succ          = "#87ffaf",
  type          = "#5fff5f",
  kw            = "#ffd65e", -- Statement
  op            = "#ff4f81",
  str           = "#ffafff",
  num           = "#afaffe",
  fn            = "#dfefff", -- Function, Identifier
  title         = "#ff87af", -- Title, htmlH1

  -- UI / TAB / SEARCH / DIFF
  bg_ui         = "#3a3a3a",   -- bg_VertSplit, bg_WinSeparator
  bg_sel        = "#005f5f",   -- Visual
  fg_sel        = "#dfefff",   -- Function, Identifier
  ui_border     = "#6c6c6c",   -- VertSplit, WinSeparator
  ui_menu       = "#eeeeee",   -- Pmenu, PmenuSel, htmlH3
  ui_status     = "#f8d1aa",
  bg_search     = "#005187",   -- Search
  bg_add        = "#004406",   -- DiffAdd
  bg_chg        = "#232345",   -- DiffChange
  bg_del        = "#663230",   -- DiffDelete
  ui_nontext    = "#5f87af",   -- NonText, SpecialKey
  fg_statusnc   = "#fedece",   -- StatusLineNC
  bg_tabfill    = "#4e4e52",   -- TabLineFill
  bg_tabs       = "#00875f",   -- TabLineSel
  fg_inc        = "#670044",   -- IncSearch
  bg_inc        = "#8aff04",   -- IncSearch
  bg_match      = "#005f00",   -- MatchParen
  fg_h2         = "#ffdfdf",   -- htmlH2
  bg_dtext      = "#343466",   -- DiffText

  ui_nontext_fg = "#585858",   -- NonText, SpecialKey
  status_nc     = "#fedece",
  tabfill_bg    = "#4e4e52",
  tabsel_bg     = "#00875f",
  incsearch_fg  = "#670044",
  incsearch_bg  = "#8aff04",
  matchparen_bg = "#005f00",
  difftext_bg   = "#343466",
}

return M
