local M = {}

function M.get(p)
  return {
    ["@operator"]                   = { link = "Operator" },

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
    ["@number"]                = { fg = p.num },
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

    ["@punctuation.delimiter"]       = { fg = p.fn },
    ["@punctuation.bracket"]         = { fg = p.kw },
    ["@punctuation.special"]         = { fg = p.active },


    ["@comment"]               = { link = "Comment" },
    ["@comment.documentation"] = { fg = p.h5 },
    ["@comment.error"]         = { fg = p.boom },
    ["@comment.warning"]       = { fg = p.warn },
    ["@comment.todo"]          = { fg = p.kw },
    ["@comment.note"]          = { fg = p.fine },

    ["@markup.strong"]         = { fg = p.h5 },
    ["@markup.italic"]         = { fg = p.h5 },
    ["@markup.strikethrough"]  = { fg = p.h5 },
    ["@markup.underline"]      = { fg = p.h5 },
    ["@markup.heading"]        = { fg = p.h5 },
    ["@markup.heading.1"]      = { fg = p.h5 },
    ["@markup.heading.2"]      = { fg = p.h5 },
    ["@markup.heading.3"]      = { fg = p.h5 },
    ["@markup.heading.4"]      = { fg = p.h5 },
    ["@markup.heading.5"]      = { fg = p.h5 },
    ["@markup.heading.6"]      = { fg = p.h5 },
    ["@markup.quote"]          = { fg = p.h5 },
    ["@markup.math"]           = { fg = p.h5 },
    ["@markup.link"]           = { fg = p.h5 },
    ["@markup.link.label"]     = { fg = p.h5 },
    ["@markup.link.url"]       = { fg = p.h5 },
    ["@markup.raw"]            = { fg = p.h5 },
    ["@markup.raw.block"]      = { fg = p.h5 },
    ["@markup.list"]           = { fg = p.h5 },
    ["@markup.list.checked"]   = { fg = p.h5 },
    ["@markup.list.unchecked"] = { fg = p.h5 },
    --
    -- @markup.strong bold text
    -- @markup.italic italic text
    -- @markup.strikethrough struck-through text
    -- @markup.underline underlined text (only for literal underline markup!)
    -- @markup.heading headings, titles (including markers)
    -- @markup.heading.1 top-level heading
    -- @markup.heading.2 section heading
    -- @markup.heading.3 subsection heading
    -- @markup.heading.4 and so on
    -- @markup.heading.5 and so forth
    -- @markup.heading.6 six levels ought to be enough for anybody
    -- @markup.quote block quotes
    -- @markup.math math environments (e.g. $ ... $ in LaTeX)
    -- @markup.link text references, footnotes, citations, etc.
    -- @markup.link.label link, reference descriptions
    -- @markup.link.url URL-style links
    -- @markup.raw literal or verbatim text (e.g. inline code)
    -- @markup.raw.block literal or verbatim text as a stand-alone block
    -- @markup.list list markers
    -- @markup.list.checked checked todo-style list markers
    -- @markup.list.unchecked unchecked todo-style list markers

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
