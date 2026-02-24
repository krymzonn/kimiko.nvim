# colorbook.py Design Document

### Overview
Standalone Python 3 script generating SVG palette books from Omarchy/Kimiko color configs. Parses multiple formats, detects duplicates, supports modes for layout/comparison. No deps except optional `tomllib` (stdlib in 3.11+). Outputs valid XML SVG for browser/Inkscape/gThumb. Command-line: `python colorbook.py [--mode sem|hue|none] files... > output.svg`.

### Architecture
- **Classes**:
  - `Swatch`: Hex color, labels (list[str]), sources (set[str] for origins like "kimiko"/"waybar").
  - `Section`: Title, list[Swatch].
  - `PaletteBook`: Title, list[Section].
- **Intermediate Rep**: Book → sections → swatches. Flat, extensible for merge/sort. Sources enable cross-file tracking.

### Parsers
File-type specific, append to book.sections:
- **Lua** (`parse_kimiko_lua`): Regex `\w+ = "#[0-9a-f]{6}"`, key as label[0], source={"kimiko"}.
- **CSS** (`parse_waybar_css`): Regex `@define-color \w+ #[\da-f]{6};`, key as label[0], source={"waybar"}.
- **TOML** (`parse_alacritty_toml`): tomllib parse [colors.*], key as label[0], source={"alacritty"}, multi-section per category (primary/normal/bright/selection).
- **Table/MD** (`parse_table`): Regex all #[\da-f]{6}, extract nearby words as labels (context window 150 chars), source={"table"}. Robust to imperfect CSV/MD; no column assumption.

### Modes (--mode)
Applied in `generate_svg`:
- **none** (default): Sections as-is, duplicate detection per hex (global seen set).
- **hue**: Sort swatches per section by HLS hue (colorsys.rgb_to_hls).
- **sem**: Merge identical hex across all sections into single Section("Semantic comparison (merged)"), union sources/labels (first set wins for labels). Enables side-by-side via labels (e.g. "kimiko / waybar").

### SVG Generation
- Config: COLS=8, W=168, H=98, PAD=16, STROKE_W=12 (touching strokes).
- Dynamic width/height (post-calc).
- Per swatch: <rect> with fill=hex, stroke=STROKE_UNIQUE (#555555) or STROKE_DUP (#3a3a3a).
- Text: hex bold, key line1, rest (sources + labels[1:] + ✓ if dup) line2, truncated >38 chars.
- Contrast: Text #111111 if luminance >0.55 else #f8f8f8.

### Future Work
- **Text Export**: Add `--export text` flag. Dump book as YAML/JSON for LLM: e.g. `book.to_dict()` with hex/labels/sources. Optimized: group by hex, list sources+labels. Practical for chain: feed to LLM for color analysis/matching.
- **More Modes**: `delta` (side-by-side columns per source, hex diff via RGB distance).
- **Parsers**: Add YAML/JSON, auto-detect. Improve table: proper CSV parse if detected.
- **UI**: CLI flags for COLS/STROKE_W, color-blind strokes (patterns).
- **Perf**: Cache seen for large books; optional sort by luminance/saturation in hue mode.
- **Tests**: Unit for parsers (mock content), integration for SVG validity.

