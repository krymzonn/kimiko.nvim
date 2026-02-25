# **kimiko.nvim – Design Document**  
**Version:** 0.2 (Sep 2025 → Feb 2026)  
**Goal:** Minimal, semantically-named, Lua-native port of 20-year Vim `kimiko.vim` for LazyVim/Omarchy. No bloat, max readability, easy contrib.

### 1. Core Principles
- **Data vs Logic** – `palette.lua` = pure table (no `hl()` calls).  
- **Compression** – tables + loops > long `hl(0, "Group", {...})` lists.  
- **Semantic keys** – `kw`, `fg3`, `bg_ui` (short, clear from original groups).  
- **No abstractions** – no classes; modular plugins in `plugins/` (export `get(p, opts)`).  
- **LazyVim-first** – cover base + extras (bufferline, telescope, neo-tree, diagnostics).  
- **Vim nostalgia** – `hi.lua`, short keys, explicit bold/underline arrays.

### 2. File Structure
```
kimiko.nvim/
├── init.lua                 → return require("kimiko").setup
├── colors/kimiko.lua        → auto-load hook
├── lua/kimiko/
    ├── init.lua             → clear + setup(opts)
│   ├── palette.lua          → all 37 colors
│   ├── hi.lua               → groups + plugin merge
│   └── plugins/             → per-plugin modules
│       └── bufferline.lua   → M.get(p, opts) returns hl table
```

### 3. Highlight Flow
`setup(opts)` → loop `groups` tables → apply bold/underline/transparent arrays → merge plugin `get(p, opts)` tables → `hl(0, name, attrs)`.

### 4. Current Coverage
- Base Vim + Treesitter basics.  
- UI: statusline, tabs/bufferline, line numbers, search, diff, floats (NormalFloat, FloatBorder).  
- Plugins: bufferline (full groups), Telescope, Neo-tree, diagnostics (Error/Warn/Hint/Info + underlines).

### 5. Future Directions (priority order)
1. Expand `treesitter` (full 50+ `@*` groups).  
2. More plugins (`plugins/` files: lualine/snacks, which-key).  
3. Italic toggle + dark/light variants (sub-tables in palette).  
4. Terminal colors (`term0`–`term15`).  
5. Omarchy PR + README/docs.

### 6. How to Jump In
- Edit palette → auto-propagates.  
- Add group? Drop into `hi.lua` table.  
- New plugin? Create `plugins/xxx.lua` with `get(p, opts)`.  
- Test: `:Lazy sync` + restart + `:hi GroupName`.

