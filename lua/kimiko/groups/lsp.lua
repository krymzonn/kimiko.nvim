local M = {}

function M.get(p)
  return {
    -- Types: link to TS for base
    ["@lsp.type.class"]         = { link = "@type" },
    ["@lsp.type.comment"]       = { link = "@comment" },
    ["@lsp.type.decorator"]     = { fg = p.active },
    ["@lsp.type.enum"]          = { link = "@type" },
    ["@lsp.type.enumMember"]    = { link = "@constant" },
    ["@lsp.type.event"]         = { fg = p.fn },
    ["@lsp.type.function"]      = { link = "@function" },
    ["@lsp.type.interface"]     = { link = "@type" },
    ["@lsp.type.keyword"]       = { link = "@keyword" },
    ["@lsp.type.macro"]         = { link = "@macro" },
    ["@lsp.type.method"]        = { link = "@function.method" },
    ["@lsp.type.modifier"]      = { link = "@keyword.modifier" },
    ["@lsp.type.namespace"]     = { link = "@module" },
    ["@lsp.type.number"]        = { link = "@number" },
    ["@lsp.type.operator"]      = { link = "@operator" },
    ["@lsp.type.parameter"]     = { link = "@variable.parameter" },
    ["@lsp.type.property"]      = { link = "@property" },
    ["@lsp.type.regexp"]        = { link = "@string.regexp" },
    ["@lsp.type.string"]        = { link = "@string" },
    ["@lsp.type.struct"]        = { link = "@type" },
    ["@lsp.type.type"]          = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.variable"]      = { link = "@variable" },

    -- Mods: explicit styles
    ["@lsp.mod.abstract"]       = { italic = true },
    ["@lsp.mod.async"]          = { fg = p.fine },
    ["@lsp.mod.declaration"]    = { bold = true },
    ["@lsp.mod.defaultLibrary"] = { fg = p.fg_see },
    ["@lsp.mod.definition"]     = { underline = true },
    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.documentation"]  = { fg = p.fgc },
    ["@lsp.mod.modification"]   = { fg = p.warn },
    ["@lsp.mod.readonly"]       = { fg = p.fg3 },
    ["@lsp.mod.static"]         = { bold = true },


    -- Typemods: overrides (add as needed)
    ["@lsp.typemod.function.async"]    = { fg = p.fn, italic = true },
    ["@lsp.typemod.variable.readonly"] = { fg = p.fg3 },
    ["@lsp.typemod.method.deprecated"] = { fg = p.fn, strikethrough = true },
  }
end

return M
