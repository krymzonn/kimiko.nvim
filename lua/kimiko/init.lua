local M = {}

function M.setup(opts)
  opts = opts or {}  -- e.g., { transparent = true }
  vim.cmd.highlight "clear"
  if vim.fn.exists "syntax_on" then
    vim.cmd.syntax "reset"
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "kimiko"

  -- Apply highlights
  require("kimiko.hi").setup()

end

return M

