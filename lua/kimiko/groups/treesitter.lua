local M = {}

function M.get(p)
  return {
    ["@keyword"]                    = { link = "Statement" },
    ["@function"]                   = { link = "Function" },
    ["@type"]                       = { link = "Type" },
    ["@number"]                     = { link = "Number" },
    ["@operator"]                   = { link = "Operator" },
    ["@comment"]                    = { link = "Comment" },

    ["@variable"]                   = { link = "Identifier" },
    ["@variable.builtin"]           = { fg = p.op, italic = true },
    ["@variable.member"]            = { fg = p.accent },
    ["@variable.parameter"]         = { fg = p.fine },
    ["@variable.parameter.builtin"] = { fg = p.fine, italic = true },

    ["@constant"]                   = { link = "Constant" },
    ["@constant.builtin"]           = { fg = p.fg_read, italic = true },
    ["@constant.macro"]             = { fg = p.fg_read, bold = true },
    --    [""]           = { fg = p.active },
    --
    ["@function.call"]              = { fg = p.fg1bri, underline = true },
    ["@function.method"]            = { fg = p.fgc, underline = true, bold = true },
    ["@function.method.call"]       = { fg = p.fgc, underline = true },
    ["@function.builtin"]           = { fg = p.fg_see, underline = true, italic = true },
    --    ["@constructor"]           = { fg = p.active },
    --
    ["@module"]                     = { fg = p.boom },
    ["@module.builtin"]             = { fg = p.boom, italic = true },
    ["@label"]                      = { fg = p.boom, bold = true },

    ["@string"]                     = { link = "String" },
    ["@string.documentation"]       = { fg = p.accent },
    ["@string.regexp"]              = { fg = p.fg3 },
    ["@string.escape"]              = { fg = p.boom },
    ["@string.special"]             = { fg = p.fg3 },
    ["@string.special.symbol"]      = { fg = p.fg2 },
    ["@string.special.path"]        = { fg = p.fg4 },
    ["@string.special.url"]         = { fg = p.fg3 },
    --    ["@keyword.function"]      = { link = "Statement" },
    --    ["@keyword.import"]        = { fg = p.kw, italic = true },
    --    ["@keyword.conditional"]   = { fg = p.warn },
    --    ["@keyword.operator"]      = { link = "Operator" },
    --
    --    ["@type.builtin"]          = { link = "Type", italic = true },
    --    ["@property"]              = { fg = p.fg3 },
    --
    --    ["@string.documentation"]  = { fg = p.fgc, italic = true },
    --    ["@string.escape"]         = { fg = p.op },
    --
    --    ["@boolean"]               = { link = "Number" },
    --    ["@number.float"]          = { link = "Number" },
    --
    --    ["@comment.todo"]          = { fg = p.warn, bold = true },
    --    ["@comment.note"]          = { fg = p.fine, italic = true },
    --
    --    ["@punctuation.delimiter"] = { fg = p.fg4 },
    --    ["@punctuation.bracket"]   = { fg = p.fg4 },
    --
    --    -- Markup (huge for Markdown in LazyVim)
    --    ["@markup.heading"]        = { fg = p.fg2, bold = true },
    --    ["@markup.strong"]         = { bold = true },
    --    ["@markup.italic"]         = { italic = true },
    --    ["@markup.link"]           = { fg = p.fg3, underline = true },
    --    ["@markup.raw"]            = { fg = p.str },
  }
end

return M
