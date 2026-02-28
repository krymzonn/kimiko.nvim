#!/usr/bin/env python3
"""
Omarchy + Kimiko colorbook SVG generator v5
Usage:
  python colorbook.py --mode sem lua/kimiko/palette.lua waybar.css alacritty.toml *.md > kimiko-book.svg
"""

import re, argparse, colorsys
from pathlib import Path
try:
    import tomllib
except ImportError:
    tomllib = None

class Swatch:
    def __init__(self, hex_color: str, labels: list[str], sources: set ):
        self.hex = hex_color.lower()
        self.labels = labels[:5]
        self.sources = sources or set()

class Section:
    def __init__(self, title: str):
        self.title = title
        self.swatches: list[Swatch] = []

class PaletteBook:
    def __init__(self):
        self.title = "Kimiko + Omarchy Palette Book"
        self.sections: list[Section] = []

# ── Parsers (source tracking) ───────────────────────────────────────────────
def parse_kimiko_lua(content: str, name: str) -> Section:
    sec = Section("kimiko.nvim/palette.lua")
    for m in re.finditer(r'(\w+)\s*=\s*["\'](#[\da-fA-F]{6})["\']', content):
        key, hexcol = m.groups()
        sec.swatches.append(Swatch(hexcol, [key], {"kimiko"}))
    return sec

def parse_waybar_css(content: str) -> Section:
    sec = Section("Omarchy waybar.css")
    for m in re.finditer(r'@define-color\s+(\w+)\s+(#[0-9a-fA-F]{6});', content):
        key, hexcol = m.groups()
        sec.swatches.append(Swatch(hexcol, [key], {"waybar"}))
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
                        sec.swatches.append(Swatch(v, [k], {"alacritty"}))
                sections.append(sec)
        return sections
    except Exception:
        return []

def parse_table(content: str) -> Section:
    sec = Section("Comparison tables")
    seen = {}
    for m in re.finditer(r'#([0-9a-fA-F]{6})', content):
        hexcol = "#" + m.group(1).lower()
        if hexcol not in seen: seen[hexcol] = []
        ctx = content[max(0, m.start()-150):m.end()+150]
        for word in re.findall(r'\b\w+\b', ctx):
            if word not in seen[hexcol] and len(word) > 2:
                seen[hexcol].append(word)
    for hexcol, labels in seen.items():
        sec.swatches.append(Swatch(hexcol, labels, {"table"}))
    return sec

# ── Helpers ────────────────────────────────────────────────────────────────
def hex_to_hue(hex_color: str) -> float:
    r = int(hex_color[1:3], 16) / 255
    g = int(hex_color[3:5], 16) / 255
    b = int(hex_color[5:7], 16) / 255
    h, _, _ = colorsys.rgb_to_hls(r, g, b)
    return h

def luminance(hex_color: str) -> float:
    r, g, b = [int(hex_color[i:i+2], 16) for i in (1, 3, 5)]
    return (0.299 * r + 0.587 * g + 0.114 * b) / 255

# ── SVG v5 ─────────────────────────────────────────────────────────────────
#W, H, PAD = 168, 98, 16
W, H, PAD = 144, 128, 0
STROKE_UNIQUE = "#555555"
STROKE_DUP    = "#3a3a3a"   # 25% gray (dark) as requested
LEFT = 26
COLS = 8

def generate_svg(book: PaletteBook, mode: str) -> str:
    # Apply mode
    if mode == "hue":
        for sec in book.sections:
            sec.swatches.sort(key=lambda s: hex_to_hue(s.hex))
    elif mode == "sem":
        # Merge duplicates into one swatch with combined sources
        merged = {}
        for sec in book.sections:
            for sw in sec.swatches:
                if sw.hex not in merged:
                    merged[sw.hex] = Swatch(sw.hex, sw.labels[:], sw.sources)
                else:
                    merged[sw.hex].sources.update(sw.sources)
                    # keep first good label set
        # rebuild sections as one big semantic section
        big_sec = Section("Semantic comparison (merged)")
        for sw in merged.values():
            big_sec.swatches.append(sw)
        book.sections = [big_sec]   # replace everything with merged view

    seen = set()
    width = LEFT + COLS * (W + PAD) + PAD

    svg = [f'''<?xml version="1.0" encoding="UTF-8"?>
<svg width="{width}" height="9999" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <style>
      text {{ font-family: GoMono Nerd Font Mono, monospace; }}
      .title {{ font-size: 26px; fill: #f8d1aa; font-weight: bold; }}
      .section {{ font-size: 18px; fill: #eeeeee; }}
      .hex {{ font-size: 14px; font-weight: bold; }}
      .label {{ font-size: 12px; font-family: sans; }}
    </style>
  </defs>
  <text x="{LEFT}" y="46" class="title">{book.title}</text>
''']

    y = 100
    for sec in book.sections:
        svg.append(f'  <text x="{LEFT}" y="{y}" class="section">{sec.title}</text>')
        y += 18
        x = LEFT
        count = 0
        for sw in sec.swatches:
            dup = sw.hex in seen
            if not dup: seen.add(sw.hex)
            stroke = STROKE_DUP if dup else STROKE_UNIQUE
            tc = "#111111" if luminance(sw.hex) > 0.55 else "#f8f8f8"

            key = sw.labels[0]
            src_tag = "/".join(sorted(sw.sources)) if hasattr(sw, 'sources') and sw.sources else ""
            rest = (src_tag + "/" if src_tag else "") + "/".join(sw.labels[1:])
            rest += " ✓" if dup else ""
            if len(rest) > 38: rest = rest[:35] + "…"

            svg.append(f'''  <g>
    <rect x="{x}" y="{y}" width="{W}" height="{H}" rx="8" fill="{sw.hex}" stroke="{stroke}" stroke-width="0.12"/>
    <text x="{x+10}" y="{y+24}" fill="{tc}" class="hex">{sw.hex}</text>
    <text x="{x+10}" y="{y+42}" fill="{tc}" class="hex">{key}</text>
    <text x="{x+10}" y="{y+58}" fill="{tc}" class="label">{rest}</text>
  </g>''')

            x += W + PAD
            count += 1
            if count % COLS == 0:
                x = LEFT
                y += H + 16
        if count % COLS != 0: y += H + 16
        y += 50

    svg[-1] = svg[-1].replace('height="9999"', f'height="{y+50}"')
    svg.append("</svg>")
    return "\n".join(svg)

# ── Main ───────────────────────────────────────────────────────────────────
def main():
    p = argparse.ArgumentParser()
    p.add_argument("--mode", choices=["none", "sem", "hue"], default="none")
    p.add_argument("files", nargs="*", help="palette.lua waybar.css alacritty.toml *.md")
    args = p.parse_args()

    book = PaletteBook()
    for f in args.files:
        path = Path(f)
        if not path.exists(): continue
        content = path.read_text(encoding="utf-8")
        if path.suffix == ".lua":
            book.sections.append(parse_kimiko_lua(content, path.name))
        elif path.suffix == ".css":
            book.sections.append(parse_waybar_css(content))
        elif path.suffix == ".toml":
            for s in parse_alacritty_toml(content):
                book.sections.append(s)
        else:
            book.sections.append(parse_table(content))

    print(generate_svg(book, args.mode))

if __name__ == "__main__":
    main()

