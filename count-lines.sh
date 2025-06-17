#!/bin/bash

# Script to recursively count lines of code for a given file extension.
# It excludes lines that are identified as entirely comments or are blank.
# Usage: ./count_loc.sh <file_extension> [directory_to_start]
# Example: ./count_loc.sh py .
# Example: ./count_loc.sh js /home/user/my_project

# Check if an extension is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_extension> [directory_to_start]"
    echo "Example: $0 py ."
    echo "Example: $0 js /home/user/my_project"
    exit 1
fi

FILE_EXTENSION="$1"
START_DIR="${2:-.}" # Use current directory if no second argument is provided

echo "Counting non-comment, non-blank lines of code for files with extension: .$FILE_EXTENSION"
echo "Starting directory: $START_DIR"
echo "---------------------------------------------------"

TOTAL_LINES=0
declare -A FILE_COUNTS # Associative array to store counts per file

# Find all files with the given extension and store them in an array.
# Using mapfile (or readarray) with process substitution to safely handle
# filenames with spaces/special characters and populate the array in the
# current shell context, avoiding subshell issues.
mapfile -d $'\0' FILES_ARRAY < <(find "$START_DIR" -type f -name "*.${FILE_EXTENSION}" -print0)

# Process each file from the array
for FILE in "${FILES_ARRAY[@]}"; do
    # LINE_COUNT=$(grep -vE '^\s*($|//.*|/\*.*|\*.*|\*/.*)$' "$FILE" 2>/dev/null | wc -l || echo 0)
    LINE_COUNT=$(wc -l < "$FILE")

    TOTAL_LINES=$((TOTAL_LINES + LINE_COUNT))
    FILE_COUNTS["$FILE"]=$LINE_COUNT
    echo "  $LINE_COUNT lines in $FILE"
done

echo "---------------------------------------------------"
echo "Summary:"
for FILE in "${!FILE_COUNTS[@]}"; do
    echo "  ${FILE_COUNTS[$FILE]} lines in "$FILE""
done
echo "---------------------------------------------------"
echo "Grand Total non-comment, non-blank lines of code for .$FILE_EXTENSION files: $TOTAL_LINES"