local M = {}

function M.colorscheme()
  -- Load the main colors
  require("themery.colors").apply()
end

function M.lualine()
  return require("themery.lualine")
end

function M.snacks()
  require("themery.snacks").apply()
end

function M.treesitter()
  require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
  })
end

return M