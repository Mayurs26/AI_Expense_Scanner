import sys
sys.stdin.reconfigure(encoding='utf-8')

with open('lib/features/dashboard/presentation/screens/dashboard_screen.dart', 'r', encoding='utf-8') as f:
    text = f.read()

lines = text.split('\n')
for i, line in enumerate(lines):
    # Fix garbled over-budget text
    if 'Over budget' in line and any(0x00C3 <= ord(c) <= 0x00CF for c in line):
        lines[i] = "                  summary.isOverBudget ? '\u26a0\ufe0f Over budget' : 'Budget remaining',"
    # Fix garbled streak emoji (fire emoji expected)  
    if 'fontSize: 28' in line and any(0x00C3 <= ord(c) <= 0x00CF for c in line):
        lines[i] = "          const Text('\U0001f525', style: TextStyle(fontSize: 28)),"

text = '\n'.join(lines)

with open('lib/features/dashboard/presentation/screens/dashboard_screen.dart', 'w', encoding='utf-8') as f:
    f.write(text)

print('Dashboard UTF-8 fix done')
