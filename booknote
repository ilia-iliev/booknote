#!/bin/bash

trim() {
    echo "$1" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

TITLE=$(trim "$1")
AUTHOR=$(trim "$2")

if [ -z "$TITLE" ] || [ -z "$AUTHOR" ]; then
    echo "Usage: booknote \"Book Title\" \"Author Name\"" >&2
    exit 1
fi

# Slug: lowercase, non-alphanumerics collapsed into single underscores
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]\+/_/g' -e 's/^_//' -e 's/_$//')
FILENAME="$SLUG.md"
TODAY=$(date +%F)

if [ -e "$FILENAME" ]; then
    echo "$FILENAME already exists" >&2
    exit 1
fi

# Create the file and load the questions
cat << EOF > "$FILENAME"
TITLE: $TITLE
AUTHOR: $AUTHOR
DATE: $TODAY

# 1. What is the book about as a whole?

# 2. What is being said in detail, and how?

# 3. Is the book true, in whole or part?

# 4. What of it?

EOF

echo "$FILENAME"
xdg-open "$FILENAME"
