local colors = require("kimiko.colors").palette

local kimiko = {}

kimiko.normal = {
  a = { fg = colors.bg1, bg = colors.color2, gui = "bold" },
  b = { fg = colors.fg1, bg = "#2A2A2A" },
  c = { fg = colors.uic1, bg = "#1A1A1A" },
}

kimiko.insert = {
  a = { fg = colors.bg1, bg = colors.color1, gui = "bold" },
}

kimiko.visual = {
  a = { fg = colors.bg1, bg = colors.color6, gui = "bold" },
}

kimiko.replace = {
  a = { fg = colors.bg1, bg = colors.color5, gui = "bold" },
}

kimiko.command = {
  a = { fg = colors.bg1, bg = colors.color3, gui = "bold" },
}

kimiko.inactive = {
  a = { fg = colors.uic1, bg = colors.bg1 },
  b = { fg = colors.uic1, bg = colors.bg1 },
  c = { fg = colors.uic1, bg = colors.bg1 },
}

return kimiko 