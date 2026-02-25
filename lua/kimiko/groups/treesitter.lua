local M = {}

function M.get(p)
  return {
    ["@keyword"]  = { link = "Statement" },
    ["@function"] = { link = "Function" },
    ["@type"]     = { link = "Type" },
    ["@string"]   = { link = "String" },
    ["@number"]   = { link = "Number" },
    ["@operator"] = { link = "Operator" },
    ["@comment"]  = { link = "Comment" },

    --    ["@variable"]              = { fg = p.fg1 },
    --    ["@variable.parameter"]    = { fg = p.fg1, italic = true },
    --    ["@variable.member"]       = { fg = p.fg3 },
    --    ["@variable.builtin"]      = { fg = p.fg_see, italic = true },
    --
    --    ["@function.call"]         = { fg = p.fn },
    --    ["@function.method"]       = { fg = p.fn },
    --    ["@function.builtin"]      = { fg = p.fn, italic = true },
    --    ["@constructor"]           = { fg = p.active },
    --
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
