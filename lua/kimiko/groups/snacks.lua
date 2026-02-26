local M = {}

function M.get(p)
  return {
    SnacksIndent      = { fg = p.bg1 },  -- very subtle
    SnacksIndentScope = { fg = p.line }, -- visible but calm
    SnacksIndentChunk = { fg = p.line, bold = true },
    --FoldColumn        = { fg = p.fg_read, bg = p.boom },
    --Folded            = { fg = p.fg_see, bg = p.line },

    -- Gutter control (overrides LazyVim defaults)
    --LineNr            = { fg = p.fg_see, bg = "NONE" },
    --CursorLineNr      = { fg = p.fg2, bold = true, bg = "NONE" },

    --SignColumn        = { fg = p.fg_see, bg = "NONE" },
    --CursorLineSign    = { fg = p.active, bg = "NONE" },

  }
end

return M
