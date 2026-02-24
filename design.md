**kimiko.nvim – Design Document**  
**Version:** 0.1 (Sep 2025 → Feb 2026)  
**Goal:** Minimal, semantically-named, Lua-native port of 20-year Vim `kimiko.vim` for LazyVim/Omarchy. No bloat, max readability, easy contrib.

### 1. Core Principles
- **Data vs Logic** – `palette.lua` = pure table (no `hl()` calls).  
- **Compression** – tables + loops > long `hl(0, "Group", {...})` lists.  
- **Semantic keys** – `kw`, `fg3`, `bg_ui` (short, obvious from original groups).  
- **No abstractions** – no classes, no extra modules unless proven needed.  
- **LazyVim-first** – cover base + common extras (bufferline, telescope, neo-tree, diagnostics).  
- **Vim nostalgia** – `hi.lua`, short keys, explicit bold/underline arrays.

### 2. File Structure (current)
```
kimiko.nvim/
├── init.lua                 → return require("kimiko").setup
├── colors/kimiko.lua        → auto-load hook
├── lua/kimiko/
│   ├── init.lua             → clear + setup(opts)
│   ├── palette.lua          → all 35 colors
│   └── hi.lua               → groups
```

### 3. Highlight Flow
`setup()` → loop over `groups` tables → apply bold/underline arrays → force no-italic on tabs → `hl(0, name, attrs)`

### 4. Current Coverage
- Base Vim + Treesitter basics  
- UI: statusline, tabs/bufferline, line numbers, search, diff  
- Plugins: minimal Telescope, Neo-tree, diagnostics

### 5. Future Directions (priority order)
1. Expand `treesitter` (20–30 more `@*` groups)  
2. Full LazyVim plugin set (`plugins/` sub-tables: telescope, neo-tree, snacks, lualine, which-key)  
3. Italic toggle + dark/light variants (sub-tables in palette)  
4. Terminal colors (`term0`–`term15`)  
5. Omarchy PR + documentation  

### 6. How to Jump In
- Edit palette → auto-propagates  
- Add new group? Drop into correct table  
- New plugin? Add `xxx = { … }` table  
- Test: `:Lazy sync` + restart + `:hi GroupName`

