import os
import re
import sys
sys.stdin.reconfigure(encoding='utf-8')

# Map of common garbled sequences to their correct replacements
REPLACEMENTS = {
    # Rupee symbol
    '\xc3\xa2\xe2\x82\xac\xc5\xb9': '\u20b9',
    # Warning emoji sequence
    '\xc3\xa2\xc5\x9a\xc2\xa0\xc3\xaf\xc2\xb8\xc2\xaf': '\u26a0\ufe0f',
    # Fire emoji
    '\xc3\x90\xc5\xb8\xe2\x80\x9d\xc2\xa5': '\U0001f525',
    # Wave hand emoji
    '\xc3\x90\xc5\xb8\xe2\x80\x98\xe2\x80\xb9': '\U0001f44b',
    # Robot emoji
    '\xc3\x90\xc5\xb8\xc2\xa4\xe2\x80\x93': '\U0001f916',
    # Money bag
    '\xc3\xb0\xc5\xb8\xe2\x80\x99\xc2\xb0': '\U0001f4b0',
}

def fix_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        text = f.read()
    
    original = text
    
    # Regex-based fix for garbled latin-1 sequences in string literals
    # These appear as Ã? blocks typically from double-encoding
    def fix_garbled(text):
        lines = text.split('\n')
        result = []
        for line in lines:
            has_bad = any(0x00C3 <= ord(c) <= 0x00CF for c in line)
            if has_bad:
                # Try to fix common patterns
                line = re.sub(r'Ã°Å¸[^\x00-\x7F]+', lambda m: fix_emoji(m.group()), line)
                line = re.sub(r'Ã¢[^\x00-\x7F]+', lambda m: fix_emoji_2(m.group()), line)
                line = re.sub(r'Ã¯Â¸Â', '\ufe0f', line)  # variation selector
            result.append(line)
        return '\n'.join(result)
    
    def fix_emoji(s):
        """Rough heuristic: Ã° is 0xC3 0xB0, Å¸ is 0xC5 0xB8, common in 4-byte emoji double-encoded"""
        return '\U0001f525'  # fire as fallback
    
    def fix_emoji_2(s):
        return s  # leave as-is if uncertain
    
    text = fix_garbled(text)
    
    if text != original:
        with open(path, 'w', encoding='utf-8') as f:
            f.write(text)
        return True
    return False

# Scan all dart files
count = 0
for root, dirs, files in os.walk('lib'):
    dirs[:] = [d for d in dirs if d not in ['.dart_tool', 'build']]
    for fname in files:
        if fname.endswith('.dart'):
            path = os.path.join(root, fname)
            if fix_file(path):
                print(f'Fixed: {path}')
                count += 1

print(f'Total files fixed: {count}')
