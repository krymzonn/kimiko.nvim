import re
import argparse
from collections import defaultdict

# CLI args
parser = argparse.ArgumentParser(description="Parse Vim colorscheme for unique values by key.")
parser.add_argument("file", help="Path to .vim file")
parser.add_argument("--key", default="guifg", help="Key to extract (e.g., guifg, guibg, gui, ctermfg)")
args = parser.parse_args()

# Read file
with open(args.file, 'r') as f:
    content = f.read()

# Dynamic regex: hi Group key=value (capture group and value)
# Value patterns: hex for fg/bg, words for gui, nums for cterm
if args.key in ["guifg", "guibg"]:
    val_pattern = r"(#[0-9a-fA-F]{6})"
elif args.key == "gui":
    val_pattern = r"(\S+)"  # e.g., bold,italic
elif args.key in ["ctermfg", "ctermbg"]:
    val_pattern = r"(\d+)"
else:
    val_pattern = r"(\S+)"  # Generic

pattern = rf'^\s*(?:hi|highlight)\s+(\S+).*?{args.key}\s*=\s*{val_pattern}'

matches = re.findall(pattern, content, re.MULTILINE | re.IGNORECASE)

# Group by value
uses = defaultdict(list)
for group, value in matches:
    if args.key in ["guifg", "guibg"]:
        value = value.lower()  # Normalize hex
    elif args.key == "gui":
        value = ','.join(sorted(value.split(',')))  # Sort styles for uniqueness
    uses[value].append(group)

# Output unique values with uses (sorted)
for value in sorted(uses.keys()):
    print(f"- {value}: {', '.join(sorted(uses[value]))}")

