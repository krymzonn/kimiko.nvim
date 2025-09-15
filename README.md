# Themery (Neovim Theme Template)

Themery is a starter template for building and publishing your own Neovim colorscheme plugin. It comes with an example theme ("themery") demonstrating:

- Centralized palette with semantic slots
- Treesitter, UI, and popular plugin highlight groups
- Lualine, Snacks.nvim, Noice.nvim, Neo-tree, todo-comments integrations

Fork it, rename it, swap the palette values, and you have a new theme.

## Why This Template?

- Opinionated yet minimal structure (one palette → many modules)
- Semantic color slots (change intent, not 200 hex codes)
- Clearly commented palette explaining usage of each key
- Modular apply() functions—remove what you don't need
- Ready for local development via `lazy.nvim`

## Quick Start (TL;DR)

1. Fork this repo (or use "Use this template")
2. Rename occurrences of `themery` to your theme name (e.g. `moonlightedge`)
3. Rename directory `lua/themery/` → `lua/moonlightedge/`
4. Edit `lua/moonlightedge/colors.lua` palette values only first
5. Load locally with a path plugin spec in your Neovim config
6. Tweak highlight logic if desired (Treesitter, plugins, etc.)
7. Add screenshots & publish to GitHub (name your repo moonlightedge.nvim) + a tag

---

## 1. Renaming the Template

Assume your new theme name is `moonlightedge` (replace with yours):

Rename the main module directory:

```bash
mv lua/themery lua/moonlightedge
```

Search & replace the name inside the repo.

Update the README accordingly.

## 2. Understanding the Palette

Open `lua/<yourtheme>/colors.lua`. Each palette key has a comment describing intent. Adjust hex values but try to preserve roles:

| Slot    | Role Summary                | Examples of Usage                           |
| ------- | --------------------------- | ------------------------------------------- |
| bg0     | Deepest backdrop            | (rare) overlays, max contrast bases         |
| bg1     | Main editor background      | Normal text background                      |
| bg2     | Secondary surface           | CursorLine, popup, selection, subtle panels |
| bg3     | Elevated/UI surface         | StatusLine, TabLineSel, titles              |
| fg0     | Max contrast text           | Headings, markup headings                   |
| fg1     | Primary text                | Normal fg                                   |
| fg2     | Secondary text              | Comments alt, dimmer text                   |
| fg3     | Tertiary/meta               | LineNr, subtle info                         |
| selbg   | Visual selection bg         | Visual, matches                             |
| selfg   | Foreground inside selection | Visual text                                 |
| comment | Comment text                | @comment, Comment                           |
| color1  | Error / strong semantic     | Error, statements, removed lines            |
| color2  | Primary accent / success    | Mode badges, added lines                    |
| color3  | Attention / highlight       | TODO, search, matches                       |
| color4  | Constants / modified        | Constants, modified, neutral warm accent    |
| color5  | Types / secondary           | @type, replace mode                         |
| color6  | Keywords / structural       | Keywords, directives, visual mode accent    |
| uic1    | Structural UI / borders     | Win separators, borders, guides             |

Tips:

- Start with backgrounds & primary foreground first (bg1, fg1)
- Ensure WCAG-ish contrast for `fg1` on `bg1` (~4.5:1+ preferred)
- Keep semantic intent coherent if you later recolor accents
- You can repurpose slots, but document it so users know your intent

## 3. Local Development Install

Clone your fork somewhere, e.g. `~/Developer/moonlightedge` then in your Neovim `lazy.nvim` setup:

```lua
{ dir = '~/Developer/moonlightedge', name = 'moonlightedge', priority = 1000, lazy = false, config = function()
  vim.cmd.colorscheme 'moonlightedge'
end }
```

Reload Neovim or run `:Lazy sync`.

During iteration:

- Edit palette → `:colorscheme moonlightedge` to reapply
- Inspect highlights: `:hi SomeGroup` or `:Telescope highlights`

## 4. Adjusting Highlights

Modules under `lua/<theme>/`:

- `colors.lua` — palette + core highlight groups
- `treesitter.lua` — semantic treesitter groups (`@` prefixed)
- `lualine.lua` — lualine theme table (returned, not applied directly)
- `noice.lua`, `snacks.lua`, `neotree.lua`, `todo-comments.lua` — plugin integrations

Remove any integrations you don’t use. Safe: delete file + remove `require("<theme>.<module>").apply()` lines in `colors.lua`.

Add new ones by creating a file and following the same pattern:

```lua
local colors = require('<theme>.colors').palette
local M = {}
function M.apply()
  local p = colors
  vim.api.nvim_set_hl(0, 'NewPluginGroup', { fg = p.color2, bg = p.bg2 })
end
return M
```

Call it from `colors.lua` inside `M.apply()`.

## 5. Publishing Your Theme

When you’re ready:

1. Pick a final name (avoid collisions on GitHub & existing themes)
2. Update README title, description, examples
3. Remove unused integrations (trim bloat for users)
4. Add screenshots (see below)
5. Run a quick highlight audit (`:Telescope highlights` or `:Inspect` with Treesitter)
6. Tag a release: `git tag -a v0.1.0 -m "Initial release" && git push --tags`
7. (Optional) Add to awesome lists / submit to Neovim theme aggregators

### Screenshot Suggestions

Use a neutral font and show:

- Coding buffer (mixed language) with Treesitter
- Diff / git signs
- Completion popup
- Lualine / statusline
- Plugin integrations (Snacks dashboard, Neo-tree, etc.)

## 6. User Installation (Published)

After publishing to GitHub at `user/moonlightedge.nvim`:

```lua
return {
  { "tahayvr/vhs80.nvim", lazy = false, priority = 1000 },
  {
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "vhs80",
		},
	},
}
```

## 8. Extending The Palette

If you need more slots, prefer semantic names over vague ones:

```lua
-- Add near the bottom
accent_info = '#3A9AD9'   -- informational messages
accent_hint = '#7FB069'   -- subtle suggestions
```

Document them with comments.

## 10. Contributing Back

If you improve structure (new semantic slot ideas, helper utilities) feel free to open a PR here so all derivative themes can benefit.

---

Original example theme name: `themery` (retained for reference). Replace everywhere when creating your own.

Happy theming! 🎨

## License

MIT – use freely in your own theme projects.
