local hl = vim.api.nvim_set_hl
local p = require("kimiko.palette").palette

local groups = {
  base = {
    Normal     = { fg = p.fg1 },
    NonText    = { fg = p.fg4 },
    SpecialKey = { fg = p.fg4 },
    ModeMsg    = { fg = p.fg_see },
    MoreMsg    = { fg = p.fg_read },
  },
  syntax = {
    Comment     = { fg = p.h6 },
    Statement   = { fg = p.kw },
    Conditional = { fg = p.warn },
    Type        = { fg = p.fg4 },
    Function    = { fg = p.fn },
    Identifier  = { fg = p.fg1bri },
    String      = { fg = p.str },
    Number      = { fg = p.num },
    Operator    = { fg = p.op },
    PreProc     = { fg = p.fg4 },
    Constant    = { fg = p.fg_read },
    Special     = { fg = p.accent },
    Todo        = { fg = p.kw },
  },
  docstructure = {
    htmlH1 = { fg = p.op },
    htmlH2 = { fg = p.fg2 },
    htmlH3 = { fg = p.fg3 },
    htmlH4 = { fg = p.fg4 },
    htmlH5 = { fg = p.h5 },
    htmlH6 = { fg = p.h6 },
  },
  diff = {
    DiffAdd    = { bg = p.bg_add },
    DiffChange = { bg = p.bg_chg },
    DiffDelete = { bg = p.bg_del, fg = p.deep_inc },
    DiffText   = { bg = p.bg_vis },
    --DiffAdd    = { link = "GitSignsAdd"},
    --DiffChange = { link = "GitSignsChange"},
    --DiffDelete = { link = "GitSignsDelete"},
    --DiffText   = { link = "GitSignsAdd"},
  },
  plugins = {
    DiagnosticError    = { fg = p.boom },
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
    Delimiter       = { link = "Special" },
  },
}
groups.treesitter = require("kimiko.groups.treesitter").get(p)
groups.ui = require("kimiko.groups.ui").get(p)
--groups.lsp = require("kimiko.groups.lsp").get(p) -- goes first
groups.snacks = require("kimiko.groups.snacks").get(p)

local bold_groups = {
  "Conditional", "Define", "Exception", "Include", "Operator", "Type",
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
  "MsgArea", "EndOfBuffer", "ModeMsg", "MoreMsg", "LineNr",
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
