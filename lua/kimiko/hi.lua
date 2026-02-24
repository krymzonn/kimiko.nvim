local hl = vim.api.nvim_set_hl
local p = require("kimiko.palette").palette

local groups = {
  base = {
    Normal       = { fg = p.fg1, bg = p.bg1 },
    LineNr       = { fg = p.line },
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
    StatusLine   = { fg = p.ui_status, bg = p.bg_ui },
    StatusLineNC = { fg = p.fg_statusnc, bg = p.bg_ui },
    TabLine      = { fg = p.fg_dim, bg = p.bg_ui },
    TabLineFill  = { fg = p.fg_dim, bg = p.bg_tabfill },
    TabLineSel   = { fg = p.fg_dim, bg = p.bg_tabs },
    VertSplit    = { fg = p.ui_border, bg = p.bg_ui },
    Search       = { fg = p.fg0, bg = p.bg_search },
    IncSearch    = { fg = p.fg_inc, bg = p.bg_inc },
    Visual       = { bg = p.bg_sel },
    MatchParen   = { bg = p.bg_match },
    htmlH1       = { fg = p.title },
    htmlH2       = { fg = p.fg_h2 },
    htmlH3       = { fg = p.fg2 },
    htmlH4       = { fg = p.fg3 },
    htmlH5       = { fg = p.fg3 },
    htmlH6       = { fg = p.fg4 },
  },
  diff = {
    DiffAdd    = { bg = p.bg_add },
    DiffChange = { bg = p.bg_chg },
    DiffDelete = { bg = p.bg_del },
    DiffText   = { bg = p.bg_dtext },
  },
  bufferline = {
    BufferLineFill           = { bg = p.bg_ui },
    BufferLineBackground     = { fg = p.fg_dim, bg = p.bg_ui },
    BufferLineBuffer         = { fg = p.fg_dim, bg = p.bg_ui },
    BufferLineBufferSelected = { fg = p.ui_status, bg = p.bg_ui },
    BufferLineTab            = { fg = p.fg_dim, bg = p.bg_ui },
    BufferLineTabSelected    = { fg = p.ui_status, bg = p.bg_ui },
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
}
local bold_underline_groups = {
  "Function", "TabLine", "TabLineFill", "TabLineSel", "Title", "Todo",
  "htmlH3", "htmlH4",
}
local underline_groups = {} -- left empty

return {
  setup = function()
    for _, tbl in pairs(groups) do
      for name, attrs in pairs(tbl) do
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
        -- Force no italic on tabs (LazyVim bufferline default)
        if name:match("^TabLine") or name:match("^BufferLine") then
          attrs.italic = false
        end
        hl(0, name, attrs)
      end
    end
  end,
}
