local hl = vim.api.nvim_set_hl
local p = require("kimiko.palette").palette

local groups = {
  base = {
    Normal       = { fg = p.fg1 },
    LineNr       = { fg = p.line },
    CursorLineNr = { fg = p.ui_status },
    LineNrAbove  = { fg = p.fg_dim },
    LineNrBelow  = { fg = p.fg_dim },
    CursorLine   = { bg = p.bg1 },
    CursorColumn = { bg = p.bg2 },
    ColorColumn  = { bg = p.bg0 },
    NonText      = { fg = p.ui_nontext },
    SpecialKey   = { fg = p.ui_nontext },
    ModeMsg      = { fg = p.fg_dim },
    MoreMsg      = { fg = p.fg_dim },
  },
  syntax = {
    Comment         = { fg = p.fgc },
    Statement       = { fg = p.kw },
    Conditional     = { fg = p.warn },
    Type            = { fg = p.type },
    Function        = { fg = p.fn },
    Identifier      = { fg = p.fn },
    String          = { fg = p.str },
    Number          = { fg = p.num },
    Operator        = { fg = p.op },
    PreProc         = { fg = p.op },
    Constant        = { fg = p.succ },
    Special         = { fg = p.err },
    Todo            = { fg = p.warn },
    pythonStatement = { fg = p.kw },
    pythonBuiltin   = { fg = p.type },
  },
  docstructure = {
    htmlH1 = { fg = p.title },
    htmlH2 = { fg = p.fg_h2 },
    htmlH3 = { fg = p.fg2 },
    htmlH4 = { fg = p.fg3 },
    htmlH5 = { fg = p.fg3 },
    htmlH6 = { fg = p.fg4 },
  },
  treesitter = {
    ["@keyword"]  = { link = "Statement" },
    ["@function"] = { link = "Function" },
    ["@type"]     = { link = "Type" },
    ["@string"]   = { link = "String" },
    ["@number"]   = { link = "Number" },
    ["@operator"] = { link = "Operator" },
    ["@comment"]  = { link = "Comment" },
  },
  ui = {
    Pmenu        = { fg = p.line, bg = p.bg2 },
    PmenuSel     = { fg = p.fg2, bg = p.bg_sel },
    StatusLine   = { fg = p.ui_status, bg = p.bg3 },
    StatusLineNC = { fg = p.fg_statusnc, bg = p.bg3 },
    VertSplit    = { fg = p.ui_border, bg = p.bg3 },
    Search       = { fg = p.fg0, bg = p.bg_search },
    IncSearch    = { fg = p.fg_inc, bg = p.bg_inc },
    Visual       = { bg = p.bg_sel },
    MatchParen   = { bg = p.bg_match },
    TabLine      = { fg = p.fg_dim, bg = p.bg3 },
    TabLineFill  = { fg = p.fg_dim, bg = p.bg2 },
    TabLineSel   = { fg = p.fg_dim, bg = p.bg2 },
    WinBar       = { fg = p.fg_dim, bg = p.bg3 },
    WinBarNC     = { fg = p.fg_dim, bg = p.bg3 },
  },
  diff = {
    DiffAdd    = { bg = p.bg_add },
    DiffChange = { bg = p.bg_chg },
    DiffDelete = { bg = p.bg_del },
    DiffText   = { bg = p.bg_dtext },
  },
  plugins = {
    DiagnosticError    = { fg = p.err },
    DiagnosticWarn     = { fg = p.warn },
    TelescopeBorder    = { fg = p.ui_border },
    TelescopeSelection = { bg = p.bg_search, fg = p.fn },
    WhichKey           = { fg = p.fg1 },
    NeoTreeNormal      = { fg = p.fg1, bg = p.bg1 },
  },
  links = {
    htmlTag      = { link = "htmlTagName" },
    htmlEndTag   = { link = "htmlSpecialTagName" },
    markdownCode = { link = "Number" },
    WinSeparator = { link = "VertSplit" },
  },
}

local bold_groups = {
  "Conditional", "Define", "Exception", "Identifier", "Include", "Operator",
  "PreProc", "Repeat", "Statement", "StatusLineNC", "VertSplit", "WinSeparator",
  "htmlH1", "htmlH2", "htmlH5", "pythonBuiltin", "pythonStatement",
  "CursorLineNr", "BufferLineBufferSelected", "BufferLineTabSelected",
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
  plugins.bufferline = require("kimiko.plugins.bufferline").get(p, opts)
  for _, defs in pairs(plugins) do
    for group, attrs in pairs(defs) do
      hl(0, group, attrs)
    end
  end
end

return { setup = setup }
