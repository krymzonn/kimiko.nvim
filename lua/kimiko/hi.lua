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
    Pmenu        = { fg = p.ui_menu, bg = p.bg3 },
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
  bufferline = {
    BufferLineBackground          = { fg = p.fg_dim, bg = p.bg2 },
    BufferLineBuffer              = { fg = p.fg_dim, bg = p.bg2 },
    BufferLineBufferSelected      = { fg = p.active, bg = p.bg2 },
    BufferLineBufferVisible       = { fg = p.line, bg = p.bg2 },
    BufferLineTab                 = { fg = p.fg_dim, bg = p.bg2 },
    BufferLineTabSelected         = { fg = p.op, bg = p.bg2 },
    BufferLineTabClose            = { fg = p.fg_inc, bg = p.bg2 },
    BufferLineSeparator           = { fg = p.bg2, bg = p.bg2 },
    BufferLineSeparatorSelected   = { fg = p.bg2, bg = p.bg2 },
    BufferLineModified            = { fg = p.warn, bg = p.bg2 },
    BufferLineModifiedSelected    = { fg = p.warn, bg = p.bg2 },
    BufferLineDuplicate           = { fg = p.fg_dim, bg = p.bg2 },
    BufferLineDuplicateSelected   = { fg = p.fg_dim, bg = p.bg2 },
    BufferLineIndicatorSelected   = { fg = p.succ, bg = p.bg2 },
    BufferLineCloseButton         = { fg = p.fg_inc, bg = p.bg2 },
    BufferLineCloseButtonSelected = { fg = p.err, bg = p.bg2 },
    BufferLineFill                = { fg = p.bg2, bg = p.bg2 }, -- invisible fill
    BufferLinePick                = { fg = p.fg0, bg = p.bg2 },
    BufferLinePickSelected        = { fg = p.fg0, bg = p.bg2 },
    BufferLineError               = { fg = p.err, bg = p.bg2 },
    BufferLineErrorDiagnostic     = { fg = p.err, bg = p.bg2 },
    BufferLineWarning             = { fg = p.warn, bg = p.bg2 },
    BufferLineWarningDiagnostic   = { fg = p.warn, bg = p.bg2 },
    BufferLineInfo                = { fg = p.num, bg = p.bg2 },    -- subtle blue
    BufferLineInfoDiagnostic      = { fg = p.num, bg = p.bg2 },
    BufferLineHint                = { fg = p.fg_dim, bg = p.bg2 }, -- dim hint
    BufferLineHintDiagnostic      = { fg = p.fg_dim, bg = p.bg2 },
    BufferLineTruncMarker         = { fg = p.fg_dim, bg = p.bg2 }, -- subtle ...
  },
  plugins = {
    DiagnosticError    = { fg = p.err },
    DiagnosticWarn     = { fg = p.warn },
    TelescopeBorder    = { fg = p.ui_border },
    TelescopeSelection = { bg = p.bg_sel, fg = p.fg_sel },
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
      local attrs = vim.deepcopy(def or {}) -- prevent mutation
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
end

return { setup = setup }
