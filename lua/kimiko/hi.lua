local hl = vim.api.nvim_set_hl
local p = require("kimiko.palette").palette

local groups = {
  base = {
    Normal       = { fg = p.fg1 },
    LineNr       = { fg = p.line },
    CursorLineNr = { fg = p.fg_read },
    LineNrAbove  = { fg = p.line },
    LineNrBelow  = { fg = p.line },
    CursorLine   = { bg = p.bg1 },
    CursorColumn = { bg = p.bg2 },
    ColorColumn  = { bg = p.bg0 },
    NonText      = { fg = p.ui_nontext },
    SpecialKey   = { fg = p.ui_nontext },
    ModeMsg      = { fg = p.fg_see },
    MoreMsg      = { fg = p.fg_read },
  },
  syntax = {
    Comment     = { fg = p.fgc },
    Statement   = { fg = p.kw },
    Conditional = { fg = p.warn },
    Type        = { fg = p.good },
    Function    = { fg = p.fn },
    Identifier  = { fg = p.fn },
    String      = { fg = p.str },
    Number      = { fg = p.num },
    Operator    = { fg = p.op },
    PreProc     = { fg = p.fg4 },
    Constant    = { fg = p.fg3 },
    Special     = { fg = p.fine },
    Todo        = { fg = p.warn },
  },
  docstructure = {
    htmlH1 = { fg = p.op },
    htmlH2 = { fg = p.fg2 },
    htmlH3 = { fg = p.fg3 },
    htmlH4 = { fg = p.fg4 },
    htmlH5 = { fg = p.h5 },
    htmlH6 = { fg = p.h6 },
  },
  ui = {
    Pmenu        = { fg = p.line, bg = p.bg2 },
    PmenuSel     = { fg = p.fg3, bg = p.bg_sel },
    StatusLine   = { fg = p.fg_read, bg = p.bg3 },
    StatusLineNC = { fg = p.fg_see, bg = p.bg3 },
    VertSplit    = { fg = p.line, bg = p.bg3 },
    Search       = { fg = p.fg0, bg = p.bg_search },
    IncSearch    = { fg = p.deep_inc, bg = p.active },
    Visual       = { bg = p.bg_vis },
    MatchParen   = { bg = p.bg_match },
    TabLine      = { fg = p.line, bg = p.bg3 },
    TabLineFill  = { fg = p.line, bg = p.bg2 },
    TabLineSel   = { fg = p.line, bg = p.bg2 },
    WinBar       = { fg = p.line, bg = p.bg3 },
    WinBarNC     = { fg = p.line, bg = p.bg3 },
  },
  diff = {
    DiffAdd    = { bg = p.bg_add },
    DiffChange = { bg = p.bg_chg },
    DiffDelete = { bg = p.bg_del },
    DiffText   = { bg = p.bg_vis },
  },
  plugins = {
    DiagnosticError    = { fg = p.err },
    DiagnosticWarn     = { fg = p.warn },
    TelescopeBorder    = { fg = p.line },
    TelescopeSelection = { bg = p.bg_search, fg = p.fn },
    WhichKey           = { fg = p.fg1 },
    NeoTreeNormal      = { fg = p.fg1, bg = p.bg1 },
  },
  links = {
    htmlTag         = { link = "htmlTagName" },
    htmlEndTag      = { link = "htmlSpecialTagName" },
    markdownCode    = { link = "Number" },
    WinSeparator    = { link = "VertSplit" },
    pythonStatement = { link = "Statement" },
    pythonBuiltin   = { link = "Type" },
  },
}
groups.treesitter = require("kimiko.groups.treesitter").get(p)

local bold_groups = {
  "Conditional", "Define", "Exception", "Include", "Operator",
  "PreProc", "Repeat", "Statement", "StatusLineNC", "VertSplit", "WinSeparator",
  "htmlH1", "htmlH2", "htmlH5", "htmlH6", "pythonBuiltin", "pythonStatement",
}
local bold_underline_groups = {
  "Function", "TabLine", "TabLineFill", "TabLineSel", "Title", "Todo",
  "htmlH3", "htmlH4",
}
local underline_groups = {} -- left empty
local transparent_groups = {
  "Normal", "NormalNC", "NonText", "SpecialKey", "SignColumn", "FoldColumn",
  "MsgArea", "EndOfBuffer", "ModeMsg", "MoreMsg", "LineNr", "CursorLineNr",
  "LineNrAbove", "LineNrBelow", "WinBar", "WinBarNC", "StatusLineNC",
  "TabLine", "TabLineFill", "TabLineSel", "VertSplit", "WinSeparator",
  "Pmenu", "PmenuSel", -- add floats later
}


local function setup(opts)
  for _, tbl in pairs(groups) do
    for name, def in pairs(tbl) do
      local attrs = vim.deepcopy(def or {})
      if opts.transparent and vim.tbl_contains(transparent_groups, name) and attrs.bg and attrs.bg ~= "NONE" then
        attrs.bg = "NONE"
      end
      if vim.tbl_contains(bold_groups, name) then
        attrs.bold = true
      end
      if vim.tbl_contains(bold_underline_groups, name) then
        attrs.bold = true
        attrs.underline = true
      end
      if vim.tbl_contains(underline_groups, name) then
        attrs.underline = true
      end
      if name:match("^TabLine") or name:match("^BufferLine") then
        attrs.italic = false
      end
      hl(0, name, attrs)
    end
  end

  -- Plugins (inside setup for p/opts)
  local plugins = {}
  --plugins.bufferline = require("kimiko.plugins.bufferline").get(p, opts)
  for _, defs in pairs(plugins) do
    for group, attrs in pairs(defs) do
      hl(0, group, attrs)
    end
  end
end

return { setup = setup }
