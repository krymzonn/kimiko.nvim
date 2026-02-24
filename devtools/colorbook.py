#!/usr/bin/env python3
"""
Omarchy + Kimiko colorbook SVG generator v4
Usage: python colorbook.py lua/kimiko/palette.lua waybar.css alacritty.toml *.md > kimiko-book.svg
"""

import re, argparse, sys
from pathlib import Path
try: import tomllib
except ImportError: tomllib = None

class Swatch:
    def __init__(self, hex_color: str, labels: list[str]):
        self.hex = hex_color.lower()
        self.labels = labels[:5]

class Section: 
    def __init__(self, title: str):
        self.title = title
        self.swatches: list[Swatch] = []

class PaletteBook:
    def __init__(self):
        self.title = "Kimiko + Omarchy Palette Book"
        self.sections: list[Section] = []

# ── Parsers (unchanged) ─────────────────────────────────────────────────────
def parse_kimiko_lua(content: str, name: str) -> Section:
    sec = Section(f"kimiko.nvim/palette.lua ({name})")
    for m in re.finditer(r'(\w+)\s*=\s*["\'](#[\da-fA-F]{6})["\']', content):
        key, hexcol = m.groups()
        sec.swatches.append(Swatch(hexcol, [key]))
    return sec

def parse_waybar_css(content: str) -> Section:
    sec = Section("Omarchy waybar.css")
    for m in re.finditer(r'@define-color\s+(\w+)\s+(#[0-9a-fA-F]{6});', content):
        key, hexcol = m.groups()
        sec.swatches.append(Swatch(hexcol, [key]))
    return sec

def parse_alacritty_toml(content: str) -> list[Section]:
    if not tomllib: return []
    try:
        data = tomllib.loads(content)
        sections = []
        colors = data.get("colors", {})
        for cat in ("primary", "normal", "bright", "selection"):
            if cat in colors:
                sec = Section(f"Alacritty {cat}")
                for k, v in colors[cat].items():
                    if isinstance(v, str) and v.startswith("#"):
                        sec.swatches.append(Swatch(v, [k]))
                sections.append(sec)
        return sections
    except: return []

def parse_table(content: str) -> Section:
    sec = Section("Comparison tables")
    seen = {}
    for m in re.finditer(r'#([0-9a-fA-F]{6})', content):
        hexcol = "#" + m.group(1).lower()
        if hexcol not in seen: seen[hexcol] = []
        ctx = content[max(0, m.start()-150):m.end()+150]
        for word in re.findall(r'\b\w+\b', ctx):
            if word not in seen[hexcol] and len(word) > 2: seen[hexcol].append(word)
    for hexcol, labels in seen.items():
        sec.swatches.append(Swatch(hexcol, labels))
    return sec

# ── SVG v4 – thick touching strokes ────────────────────────────────────────
W, H, PAD = 168, 98, 16          # tighter padding
STROKE_W = 12                    # wide enough to almost touch neighbour
LEFT = 26

def luminance(h: str) -> float:
    r, g, b = int(h[1:3],16), int(h[3:5],16), int(h[5:7],16)
    return (0.299*r + 0.587*g + 0.114*b)/255

def generate_svg(book: PaletteBook) -> str:
    seen = set()
    width = LEFT + 8*(W + PAD) + PAD   # 8 columns, no page break

    svg = [f'''<?xml version="1.0" encoding="UTF-8"?>
<svg width="{width}" height="9999" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <style>
      text {{ font-family: monospace; }}
      .title {{ font-size: 26px; fill: #f8d1aa; font-weight: bold; }}
      .section {{ font-size: 18px; fill: #eeeeee; }}
      .hex {{ font-size: 13px; font-weight: bold; }}
      .label {{ font-size: 11px; }}
    </style>
  </defs>
  <text x="{LEFT}" y="46" class="title">{book.title}</text>
''']

    y = 100
    for sec in book.sections:
        svg.append(f'  <text x="{LEFT}" y="{y}" class="section">{sec.title}</text>')
        y += 38
        x = LEFT
        count = 0
        for sw in sec.swatches:
            dup = sw.hex in seen
            if not dup: seen.add(sw.hex)
            stroke_col = "#aaaaaa" if dup else "#555555"   # 75% vs 50% gray (visible on dark)
            tc = "#111111" if luminance(sw.hex) > 0.55 else "#f8f8f8"

            key = sw.labels[0]
            rest = " / ".join(sw.labels[1:]) + (" ✓" if dup else "")
            if len(rest) > 38: rest = rest[:35] + "…"

            svg.append(f'''  <g>
    <rect x="{x}" y="{y}" width="{W}" height="{H}" rx="8" 
          fill="{sw.hex}" stroke="{stroke_col}" stroke-width="{STROKE_W}"/>
    <text x="{x+10}" y="{y+24}" fill="{tc}" class="hex">{sw.hex}</text>
    <text x="{x+10}" y="{y+42}" fill="{tc}" class="label">{key}</text>
    <text x="{x+10}" y="{y+58}" fill="{tc}" class="label">{rest}</text>
  </g>''')

            x += W + PAD
            count += 1
            if count % 8 == 0:
                x = LEFT
                y += H + 26   # tighter vertical too
        if count % 8 != 0: y += H + 26
        y += 50

    svg[-1] = svg[-1].replace('height="9999"', f'height="{y+50}"')
    svg.append("</svg>")
    return "\n".join(svg)

# ── Main (unchanged) ────────────────────────────────────────────────────────
def main():
    p = argparse.ArgumentParser()
    p.add_argument("files", nargs="*", help="palette.lua waybar.css alacritty.toml *.md")
    args = p.parse_args()

    book = PaletteBook()
    for f in args.files:
        path = Path(f)
        if not path.exists(): continue
        content = path.read_text(encoding="utf-8")
        if path.suffix == ".lua": book.sections.append(parse_kimiko_lua(content, path.name))
        elif path.suffix == ".css": book.sections.append(parse_waybar_css(content))
        elif path.suffix == ".toml":
            for s in parse_alacritty_toml(content): book.sections.append(s)
        else: book.sections.append(parse_table(content))

    print(generate_svg(book))

if __name__ == "__main__":
    main()
