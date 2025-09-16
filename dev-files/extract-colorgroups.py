import re
from collections import defaultdict

# Read file
with open('kimiko.vim', 'r') as f:
    content = f.read()

# Regex: hi Group guifg=#hex (captures group and guifg)
pattern = r'^\s*(?:hi|highlight)\s+(\S+).*?guifg\s*=\s*(#[0-9a-fA-F]{6})'
matches = re.findall(pattern, content, re.MULTILINE | re.IGNORECASE)

# Group by guifg
uses = defaultdict(list)
for group, guifg in matches:
    uses[guifg.lower()].append(group)  # Normalize hex case

# Output unique guifg with uses (sorted)
for guifg in sorted(uses.keys()):
    print(f"- {guifg}: {', '.join(sorted(uses[guifg]))}")

