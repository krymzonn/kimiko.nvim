#!/usr/bin/env python3
"""
kimiko colorbook SVG generator
Usage:
  python colorbook.py > kimiko.svg
  # or edit the PALETTE dict below and re-run
"""

PALETTE = {
    # Backgrounds
    "bg0": ("#080808", "Global dark bg"),
    "bg1": ("#1c1c1c", "Main bg / NeoTree"),
    "bg2": ("#262626", "CursorLine / Pmenu"),
    "bg3": ("#323030", "Pmenu / deeper UI"),

    # Text / Foregrounds
    "fg0": ("#ffffff", "Pure white text"),
    "fg1": ("#bad094", "Primary text"),
    "fg2": ("#eeeeee", "Bright text"),
    "fg3": ("#bcbcbc", "Dim text"),
    "fg4": ("#d0d0d0", "Secondary text"),
    "line": ("#bfbebc", "LineNr"),
    "fg_dim": ("#3a3a3a", "Dim UI text / inactive"),
    "fgc": ("#aed7d7", "Comments"),

    # Syntax Accents
    "err": ("#ff005f", "Error / DiagnosticError"),
    "warn": ("#fa9903", "Warning"),
    "succ": ("#87ffaf", "Success / DiagnosticOK"),
    "type": ("#5fff5f", "Types"),
    "kw": ("#ffd65e", "Keywords"),
    "op": ("#ff4f81", "Operators"),
    "str": ("#ffafff", "Strings"),
    "num": ("#afaffe", "Numbers"),
    "fn": ("#dfefff", "Functions"),
    "title": ("#ff87af", "Headings / titles"),

    # UI Elements
    "bg_ui": ("#3a3a3a", "StatusLine / TabLine / WinBar"),
    "bg_sel": ("#005f5f", "Visual / selection"),
    "fg_sel": ("#dfefff", "Selected text"),
    "ui_border": ("#6c6c6c", "VertSplit / borders"),
    "ui_menu": ("#eeeeee", "Pmenu fg"),
    "ui_status": ("#f8d1aa", "StatusLine active / Omarchy letter"),
    "ui_nontext": ("#5f87af", "NonText / concealed"),

    # Special / Diff / Search
    "bg_search": ("#005187", "Search bg"),
    "bg_add": ("#004406", "DiffAdd"),
    "bg_chg": ("#232345", "DiffChange"),
    "bg_del": ("#663230", "DiffDelete"),
    "bg_dtext": ("#343466", "DiffText"),
    "bg_tabfill": ("#4e4e52", "TabLineFill"),
    "bg_tabs": ("#00875f", "TabLineSel / active tab"),
    "fg_statusnc": ("#fedece", "StatusLineNC"),
    "fg_inc": ("#670044", "IncSearch fg"),
    "bg_inc": ("#8aff04", "IncSearch bg"),
    "bg_match": ("#005f00", "MatchParen"),
    "fg_h2": ("#ffdfdf", "htmlH2"),
}

# ─────────────────────────────────────────────────────────────────────────────
# Config
SWATCH_W, SWATCH_H = 140, 90
COLS = 6
FONT = "monospace"
HEADER_H = 50
PADDING = 20

def luminance(hexcolor: str) -> float:
    r, g, b = [int(hexcolor[i:i+2], 16) for i in (1, 3, 5)]
    return (0.299 * r + 0.587 * g + 0.114 * b) / 255

def svg_colorbook(palette: dict) -> str:
    groups = {
        "Backgrounds": [k for k in palette if k.startswith("bg")],
        "Text &amp; Foregrounds": [k for k in palette if k.startswith("fg") or k in ("line", "fgc")],
        "Syntax Accents": ["err", "warn", "succ", "type", "kw", "op", "str", "num", "fn", "title"],
        "UI Elements": ["bg_ui", "bg_sel", "fg_sel", "ui_border", "ui_menu", "ui_status", "ui_nontext"],
        "Diff &amp; Search": ["bg_search", "bg_add", "bg_chg", "bg_del", "bg_dtext", "bg_tabfill", "bg_tabs",
                              "fg_statusnc", "fg_inc", "bg_inc", "bg_match", "fg_h2"],
    }

    svg = [f'''<?xml version="1.0" encoding="UTF-8"?>
<svg width="{(SWATCH_W + PADDING) * COLS + PADDING}" height="1200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <style>
      text {{ font-family: {FONT}; font-size: 13px; }}
      .header {{ font-size: 18px; font-weight: bold; fill: #f8d1aa; }}
      .hex {{ font-size: 12px; }}
      .name {{ font-size: 11px; }}
    </style>
  </defs>
''']

    y = 30
    for group_name, keys in groups.items():
        if not keys: continue
        svg.append(f'  <text x="{PADDING}" y="{y+20}" class="header">{group_name}</text>')
        y += HEADER_H

        x = PADDING
        for i, key in enumerate(keys):
            hexcol, usage = palette[key]
            text_color = "#111111" if luminance(hexcol) > 0.5 else "#f8f8f8"

            svg.append(f'''  <g>
    <rect x="{x}" y="{y}" width="{SWATCH_W}" height="{SWATCH_H}" fill="{hexcol}" rx="4" />
    <text x="{x+10}" y="{y+25}" fill="{text_color}" class="hex">{hexcol}</text>
    <text x="{x+10}" y="{y+45}" fill="{text_color}" class="name">{key}</text>
    <text x="{x+10}" y="{y+65}" fill="{text_color}" class="name">{usage}</text>
  </g>''')

            x += SWATCH_W + PADDING
            if (i + 1) % COLS == 0:
                x = PADDING
                y += SWATCH_H + 30
        y += 50

    svg.append("</svg>")
    return "\n".join(svg)

if __name__ == "__main__":
    print(svg_colorbook(PALETTE))

