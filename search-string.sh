#!/bin/bash

# Define the strings to search for
# You can add or remove strings from this array
SEARCH_STRINGS=("ollama" "chatgpt" "gemini" "llama" "claude" "ML" "tensorflow" "pytorch" "huggingface")

# Define the file extensions to search in
# Add more extensions if needed
FILE_EXTENSIONS=("java" "scala")

# Define the starting directory for the search (e.g., current directory)
# You can change this to any path, like /home/user/myproject
START_DIR="."

echo "Starting recursive search for specified strings in Java and Scala files..."
echo "Searching in: $START_DIR"
echo "Strings to find: ${SEARCH_STRINGS[*]}"
echo "File types: ${FILE_EXTENSIONS[*]}"
echo "----------------------------------------------------"

# Convert array of extensions into a format suitable for find -o (OR)
FIND_EXPRESSION=""
for ext in "${FILE_EXTENSIONS[@]}"; do
    if [ -z "$FIND_EXPRESSION" ]; then
        FIND_EXPRESSION="-name *.$ext"
    else
        FIND_EXPRESSION="$FIND_EXPRESSION -o -name *.$ext"
    fi
done

# Build the grep pattern from the search strings
GREP_PATTERN=$(IFS='|'; echo "${SEARCH_STRINGS[*]}")

# Use find to locate files with specified extensions and then pipe to grep
# -type f : Only search for files (not directories)
# -regex : Use regular expressions for file names (more flexible than -name for multiple patterns)
# -print0 : Print file names null-delimited, which is safe for file names with spaces or special characters
# xargs -0 : Read null-delimited input from find
# grep -i : Case-insensitive search
# grep -n : Show line number
# grep -H : Always print filename (useful when only one file is passed to grep)
# grep -E : Use extended regular expressions (for the OR | operator)
# grep --color=auto : Highlight the matched string in the output

find "$START_DIR" -type f \( $FIND_EXPRESSION \) -print0 | \
xargs -0 grep -i -n -H -E --color=auto "$GREP_PATTERN"

echo "----------------------------------------------------"
echo "Search complete."

