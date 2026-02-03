#!/bin/bash

# Set the filename based on the first argument
FILENAME="${1}.md"

# Create the file and load the questions
cat << EOF > "$FILENAME"
# 1. What is the book about as a whole?

# 2. What is being said in detail, and how?

# 3. Is the book true, in whole or part?

# 4. What of it?

EOF
