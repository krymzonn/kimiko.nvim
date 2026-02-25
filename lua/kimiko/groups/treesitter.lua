local M = {}

function M.get(p)
  return {
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


    ["@function"]              = { link = "Function" },
    ["@function.call"]         = { fg = p.fg1bri, underline = true },
    ["@function.method"]       = { fg = p.fgc, underline = true, bold = true },
    ["@function.method.call"]  = { fg = p.fgc, underline = true },
    ["@function.builtin"]      = { fg = p.fg_see, underline = true, italic = true },
    --    ["@constructor"]           = { fg = p.active },
    --
    ["@module"]                = { fg = p.boom },
    ["@module.builtin"]        = { fg = p.boom, italic = true },
    ["@label"]                 = { fg = p.boom, bold = true },

    ["@string"]                = { link = "String" },
    ["@string.documentation"]  = { fg = p.accent },
    ["@string.regexp"]         = { fg = p.fg3 },
    ["@string.escape"]         = { fg = p.boom },
    ["@string.special"]        = { fg = p.fg3 },
    ["@string.special.symbol"] = { fg = p.fg2 },
    ["@string.special.path"]   = { fg = p.fg4 },
    ["@string.special.url"]    = { fg = p.fg3, underline = true },

    ["@character"]             = { fg = p.fg2 },
    ["@character.special"]     = { fg = p.boom },

    ["@boolean"]               = { fg = p.fg2 },
    ["@number"]                = { fg = p.fg3 },
    ["@number.float"]          = { fg = p.num, italic = true },


    ["@type"]              = { link = "Type" },
    ["@type.builtin"]      = { italic = true },
    ["@type.definition"]   = { underline = true },

    ["@attribute"]         = { fg = p.good },
    ["@attribute.builtin"] = { italic = true },
    ["@property"]          = { fg = p.accent },


    ["@keyword"]                     = { link = "Statement" },
    ["@keyword.coroutine"]           = { fg = p.accent, bold = true },
    ["@keyword.function"]            = { fg = p.kw, bold = true },
    ["@keyword.operator"]            = { fg = p.boom, bold = true },
    ["@keyword.import"]              = { fg = p.kw, bold = true },
    ["@keyword.type"]                = { fg = p.num, bold = true },
    ["@keyword.modifier"]            = { fg = p.h5 },
    ["@keyword.repeat"]              = { fg = p.active, bold = true },
    ["@keyword.return"]              = { fg = p.warn, bold = true },
    ["@keyword.debug"]               = { fg = p.accent, bold = true },
    ["@keyword.exception"]           = { fg = p.boom, bold = true },
    ["@keyword.conditional"]         = { fg = p.warn, bold = true },
    ["@keyword.conditional.ternary"] = { fg = p.boom, bold = true },
    ["@keyword.directive"]           = { fg = p.fg3 },
    ["@keyword.directive.define"]    = { fg = p.fg3, bold = true },

    --    @keyword keywords not fitting into specific categories
    --@keyword.coroutine keywords related to coroutines (e.g. go in Go, async/await in Python)
    --@keyword.function keywords that define a function (e.g. func in Go, def in Python)
    --@keyword.operator operators that are English words (e.g. and, or)
    --@keyword.import keywords for including or exporting modules (e.g. import, from in Python)
    --@keyword.type keywords describing namespaces and composite types (e.g. struct, enum)
    --@keyword.modifier keywords modifying other constructs (e.g. const, static, public)
    --@keyword.repeat keywords related to loops (e.g. for, while)
    --@keyword.return keywords like return and yield
    --@keyword.debug keywords related to debugging
    --@keyword.exception keywords related to exceptions (e.g. throw, catch)
    --@keyword.conditional keywords related to conditionals (e.g. if, else)
    --@keyword.conditional.ternary ternary operator (e.g. ?, :)
    --@keyword.directive various preprocessor directives and shebangs
    --@keyword.directive.define preprocessor definition directives

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
