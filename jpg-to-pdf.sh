#!/bin/bash

echo "Usage jpg-to-pdf.sh <folder-name> <output-pdf-file>"
# Directory containing the JPG files
JPG_DIR=$1

# Output PDF file name
OUTPUT_PDF=$2

# Change to the directory where JPGs are located
cd "$JPG_DIR" || { echo "Error: Directory $JPG_DIR not found."; exit 1; }

# Create the PDF from all JPG files in the directory
# The order of the JPGs in the PDF will be alphabetical
convert *.jpg "$OUTPUT_PDF"

if [ $? -eq 0 ]; then
    echo "Successfully created $OUTPUT_PDF in $JPG_DIR"
else
    echo "Error: Failed to create PDF."
fi
