local M = {}

function M.get(p)
  return {
    ["@lsp.type.function"]  = { link = "@function" },
    ["@lsp.type.method"]    = { link = "@function.method" },
    ["@lsp.type.variable"]  = { link = "@variable" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"]  = { link = "@property" },
    ["@lsp.type.class"]     = { link = "@type" },
    -- etc. for 20 more;
  }
end

return M
