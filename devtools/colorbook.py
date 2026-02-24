#!/usr/bin/env python3
"""
Omarchy + Kimiko colorbook SVG generator v2
Usage:
  python colorbook.py lua/kimiko/palette.lua waybar.css alacritty.toml comparison1.md comparison2.md > kimiko-book.svg
"""

import re
import argparse
import sys
from pathlib import Path
try:
    import tomllib
except ImportError:
    tomllib = None

class Swatch:
    def __init__(self, hex_color: str, labels: list[str]):
        self.hex = hex_color.lower()
        self.labels = labels[:4]  # limit clutter

class Section:
    def __init__(self, title: str):
        self.title = title
        self.swatches: list[Swatch] = []

class PaletteBook:
    def __init__(self):
        self.title = "Kimiko + Omarchy Palette Book"
        self.sections: list[Section] = []

# ── Parsers ──────────────────────────────────────────────────────────────────

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
    if not tomllib:
        return []
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
    except Exception:
        return []

def parse_table(content: str) -> Section:
    sec = Section("Comparison tables")
    seen = {}
    for m in re.finditer(r'#([0-9a-fA-F]{6})', content):
        hexcol = "#" + m.group(1).lower()
        if hexcol not in seen:
            seen[hexcol] = []
        # grab nearby words as labels
        ctx = content[max(0, m.start()-120):m.end()+120]
        for word in re.findall(r'\b\w+\b', ctx):
            if word not in seen[hexcol] and len(word) > 2:
                seen[hexcol].append(word)
    for hexcol, labels in seen.items():
        sec.swatches.append(Swatch(hexcol, labels))
    return sec

# ── SVG ─────────────────────────────────────────────────────────────────────

def luminance(h: str) -> float:
    r, g, b = int(h[1:3], 16), int(h[3:5], 16), int(h[5:7], 16)
    return (0.299 * r + 0.587 * g + 0.114 * b) / 255

def generate_svg(book: PaletteBook) -> str:
    COLS = 5
    W, H, PAD = 168, 98, 26
    width = COLS * (W + PAD) + PAD
    height = 180 + len(book.sections) * 280  # rough but safe

    svg = [f'''<?xml version="1.0" encoding="UTF-8"?>
<svg width="{width}" height="{height}" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <style>
      text {{ font-family: monospace; }}
      .title {{ font-size: 26px; fill: #f8d1aa; font-weight: bold; }}
      .section {{ font-size: 18px; fill: #eeeeee; }}
      .hex {{ font-size: 13px; }}
      .label {{ font-size: 11px; }}
    </style>
  </defs>
  <text x="26" y="46" class="title">{book.title}</text>
''']

    y = 100
    for sec in book.sections:
        svg.append(f'  <text x="26" y="{y}" class="section">{sec.title}</text>')
        y += 48
        x = 26
        for i, sw in enumerate(sec.swatches):
            tc = "#111111" if luminance(sw.hex) > 0.55 else "#f8f8f8"
            lbl = " / ".join(sw.labels)
            svg.append(f'''  <g>
    <rect x="{x}" y="{y}" width="{W}" height="{H}" rx="8" fill="{sw.hex}"/>
    <text x="{x+10}" y="{y+26}" fill="{tc}" class="hex">{sw.hex}</text>
    <text x="{x+10}" y="{y+48}" fill="{tc}" class="label">{lbl}</text>
  </g>''')
            x += W + PAD
            if (i + 1) % COLS == 0:
                x = 26
                y += H + 38
        y += 70
    svg.append("</svg>")
    return "\n".join(svg)

# ── Main ────────────────────────────────────────────────────────────────────

def main():
    p = argparse.ArgumentParser()
    p.add_argument("files", nargs="*", help="palette.lua / waybar.css / alacritty.toml / *.md")
    args = p.parse_args()

    book = PaletteBook()

    for f in args.files:
        path = Path(f)
        if not path.exists():
            print(f"⚠️  not found: {f}", file=sys.stderr)
            continue
        content = path.read_text(encoding="utf-8")

        if path.suffix == ".lua":
            book.sections.append(parse_kimiko_lua(content, path.name))
        elif path.suffix == ".css":
            book.sections.append(parse_waybar_css(content))
        elif path.suffix == ".toml":
            for s in parse_alacritty_toml(content):
                book.sections.append(s)
        else:
            # treat as table (your CSV/MD blocks)
            book.sections.append(parse_table(content))

    if not book.sections:
        print("No palettes loaded.", file=sys.stderr)
        return

    print(generate_svg(book))

if __name__ == "__main__":
    main()

