local p = require("kimiko.palette").palette

return {
  normal = {
    a = { fg = p.bg1, bg = p.fg_read, gui = "bold" },
    b = { fg = p.h5, bg = p.bg2 },
    c = { fg = p.fg_read, bg = p.bg3 },
  },
  insert = {
    a = { fg = p.bg1, bg = p.active, gui = "bold" },
    b = { fg = p.h5, bg = p.bg2 },
    c = { fg = p.fg_read, bg = p.bg3 },
  },
  visual = {
    a = { fg = p.bg1, bg = p.fg3, gui = "bold" },
    b = { fg = p.fg5, bg = p.bg2 },
    c = { fg = p.fg_read, bg = p.bg3 },
  },
  command = {
    a = { fg = p.bg1, bg = p.fn, gui = "bold" },
    b = { fg = p.fg5, bg = p.bg2 },
    c = { fg = p.fg_read, bg = p.bg3 },
  },
  replace = {
    a = { fg = p.bg1, bg = p.warn, gui = "bold" },
    b = { fg = p.fg5, bg = p.bg2 },
    c = { fg = p.fg_read, bg = p.bg3 },
  },
  inactive = {
    a = { fg = p.h6, bg = p.bg3 },
    b = { fg = p.h6, bg = p.bg3 },
    c = { fg = p.h6, bg = p.bg3 },
  },
}
