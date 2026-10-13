#!/bin/bash
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
mkdir "$TMP/bin" "$TMP/notes"

cat > "$TMP/bin/xdg-open" <<'EOF'
#!/bin/bash
printf '%s\n' "$*" >> "$OPEN_LOG"
EOF
cat > "$TMP/bin/sensible-editor" <<'EOF'
#!/bin/bash
printf '%s\n' "$*" >> "$EDITOR_LOG"
EOF
chmod +x "$TMP/bin/xdg-open" "$TMP/bin/sensible-editor"

(
    cd "$TMP/notes"
    OPEN_LOG="$TMP/open.log" EDITOR_LOG="$TMP/editor.log" \
        PATH="$TMP/bin:$PATH" env -u EDITOR \
        "$ROOT/booknote" "Test Book" "Test Author"
)

test "$(cat "$TMP/open.log")" = "test_book.md"
test ! -e "$TMP/editor.log"
grep -qx '## 1. What is the book about as a whole?' "$TMP/notes/test_book.md"
test -z "$(grep '^# ' "$TMP/notes/test_book.md")"
