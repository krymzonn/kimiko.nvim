local M = {}

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", { transparent = true }, opts or {})
  vim.cmd.highlight("clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "kimiko"

  require("kimiko.hi").setup(opts)
end

return M
