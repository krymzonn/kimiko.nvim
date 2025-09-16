-- lua/kimiko/highlights.lua
local hl = vim.api.nvim_set_hl
local p = require("kimiko.palette").palette

local groups = {
  base = {
    Normal = { fg = p.fg1 },
    LineNr = { fg = p.line },
    CursorLine = { bg = p.bg1 },
    ColorColumn = { bg = p.bg0 },
    -- Add more
  },
  syntax = {
    Comment = { fg = p.fgc },
    Statement = { fg = p.kw },
    Conditional = { fg = p.warn },
    Type = { fg = p.type },
    Function = { fg = p.fn, underline = true },
    Identifier = { fg = p.fn },
    String = { fg = p.str },
    Number = { fg = p.num },
    Operator = { fg = p.op },
    PreProc = { fg = p.op },
    Constant = { fg = p.succ },
    Special = { fg = p.err },
    Todo = { fg = p.warn, underline = true },
    pythonStatement = { fg = p.kw },  -- #ffff03
    pythonBuiltin = { fg = p.type },
  },
  treesitter = {
    ["@keyword"] = { link = "Statement" },
    ["@function"] = { link = "Function" },
    ["@type"] = { link = "Type" },
    ["@string"] = { link = "String" },
    ["@number"] = { link = "Number" },
    ["@operator"] = { link = "Operator" },
    ["@comment"] = { link = "Comment" },
    -- More @groups
  },
  ui = {
    Pmenu = { fg = p.ui_menu, bg = p.bg3 },
    PmenuSel = { fg = p.fg2, bg = p.bg_sel },
    StatusLine = { fg = p.ui_status, bg = p.bg_ui },
    StatusLineNC = { fg = p.fedece, bg = p.bg_ui },  -- Add #fedece if missing in palette
    TabLine = { fg = p.fg_dim, bg = p.bg_ui, underline = true },
    TabLineFill = { fg = p.fg_dim, bg = p.bg_ui, underline = true },
    TabLineSel = { fg = p.fg_dim, bg = p.bg_ui, underline = true },
    VertSplit = { fg = p.ui_border, bg = p.bg_ui },
    WinSeparator = { link = "VertSplit" },
    Search = { fg = p.fg0, bg = p.bg_search },
    IncSearch = { fg = p.err, bg = p.bg_search },
    Visual = { bg = p.bg_sel },
    MatchParen = { bg = p.bg_sel },
    htmlH1 = { fg = p.title },
    htmlH2 = { fg = p.title },
    htmlH3 = { fg = p.fg2, underline = true },
    -- More
  },
  diff = {
    DiffAdd = { bg = p.bg_add },
    DiffChange = { bg = p.bg_chg },
    DiffDelete = { bg = p.bg_del },
    DiffText = { bg = p.bg_chg },
  },
  plugins = {
    DiagnosticError = { fg = p.err },
    DiagnosticWarn = { fg = p.warn },
    TelescopeBorder = { fg = p.ui_border },
    TelescopeSelection = { bg = p.bg_sel, fg = p.fg_sel },
    WhichKey = { fg = p.fg1 },
    NeoTreeNormal = { fg = p.fg1, bg = p.bg1 },
    -- Extend
  },
  links = {  -- Pure links separate
    htmlTag = { link = "htmlTagName" },
    htmlEndTag = { link = "htmlSpecialTagName" },
    markdownCode = { link = "Number" },
  },
}

-- Apply bold globally where needed
local bold_groups = { "Conditional", "Statement", "Identifier", "Operator", "PreProc", "htmlH1", "htmlH2", "htmlH5", "pythonBuiltin", "pythonStatement", "VertSplit", "WinSeparator", "StatusLineNC" }
local bold_underline_groups = { "Function", "TabLine", "TabLineFill", "TabLineSel", "Title", "Todo", "htmlH3", "htmlH4" }

return {
  setup = function()
    for cat, tbl in pairs(groups) do
      for name, opts in pairs(tbl) do
        if vim.tbl_contains(bold_groups, name) then opts.bold = true end
        if vim.tbl_contains(bold_underline_groups, name) then opts.bold = true; opts.underline = true end
        hl(0, name, opts)
      end
    end
  end
}

