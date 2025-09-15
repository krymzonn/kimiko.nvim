local M = {}

function M.colorscheme()
  -- Load the main colors
  require("kimiko.colors").apply()
end

function M.lualine()
  return require("kimiko.lualine")
end

function M.snacks()
  require("kimiko.snacks").apply()
end

function M.treesitter()
  require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
  })
end

return M