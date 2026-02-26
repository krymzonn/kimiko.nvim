local M = {}

function M.get(p)
  return {
    SnacksIndent      = { fg = p.bg1 },  -- very subtle
    SnacksIndentScope = { fg = p.line }, -- visible but calm
    SnacksIndentChunk = { fg = p.line, bold = true },
    FoldColumn        = { fg = p.fg_read, bg = p.boom },
    Folded            = { fg = p.fg_see, bg = p.line },
  }
end

return M
