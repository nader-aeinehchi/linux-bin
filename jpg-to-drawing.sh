#!/bin/bash

# --- Configuration ---
# Usage: ./your_script_name.sh <input-folder> <output-folder>
INPUT_DIR="$1"   # First argument is the input directory
OUTPUT_DIR="$2"  # Second argument is the output directory

# Check if input and output directories are provided
if [ -z "$INPUT_DIR" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: $0 <input-folder> <output-folder>"
    echo "Example: $0 /home/user/my_photos /home/user/my_sketches"
    exit 1
fi

# Edge Detection Parameters (adjust these values)
CANNY_PARAMS="0x1+10%+30%" # Sigma, low threshold, high threshold. Adjust thresholds (e.g., 5%+15%, 15%+40%)
EDGE_STRENGTH="1"          # For -edge operator (e.g., 0.5 to 2.0)
THRESHOLD_VALUE="50%"      # For binarization (e.g., 40%, 50%, 60%). Higher value = more white.

# Rotation Option
# Set to 'true' to rotate 90 degrees clockwise, 'false' to keep original orientation
ROTATE_90_CLOCKWISE="true"

# --- Script Logic ---

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR" || { echo "Error: Could not create output directory $OUTPUT_DIR."; exit 1; }

echo "Starting line drawing conversion..."
echo "Input Directory: $INPUT_DIR"
echo "Output Directory: $OUTPUT_DIR"
echo "Rotation: $ROTATE_90_CLOCKWISE"
echo "---"

# Loop through common image extensions
for img_file in "$INPUT_DIR"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
    # Check if file exists (in case no files match the glob)
    if [ -f "$img_file" ]; then
        filename=$(basename "$img_file")
        filename_no_ext="${filename%.*}"
        output_line_drawing="$OUTPUT_DIR/${filename_no_ext}_lines.png" # Output as PNG for crisp lines

        echo "Processing: $filename"

        # Start building the ImageMagick command
        IM_COMMAND="convert \"$img_file\" \
            -colorspace Gray \
            -despeckle \
            -despeckle "

        # Add Canny or Edge detection
        IM_COMMAND+=" -canny $CANNY_PARAMS " # Canny is preferred
        # IM_COMMAND+=" -edge $EDGE_STRENGTH " # Uncomment this if Canny isn't available or desired

        # Add the common steps
        IM_COMMAND+=" -negate \
            -threshold $THRESHOLD_VALUE " # REMOVED: -morphological Open:1 \"Disk\"

        # Add rotation if enabled
        if [ "$ROTATE_90_CLOCKWISE" = "true" ]; then
            IM_COMMAND+=" -rotate 90 "
            output_line_drawing="$OUTPUT_DIR/${filename_no_ext}_lines_rotated.png" # Append _rotated to filename
        fi
        
        # Add the output file
        IM_COMMAND+=" \"$output_line_drawing\""

        # Execute the command
        eval "$IM_COMMAND"

        if [ $? -eq 0 ]; then
            echo "  -> Saved line drawing to: $output_line_drawing"
        else
            echo "  -> Error processing $filename. Skipping."
        fi
    fi
done

echo "---"
echo "Line drawing conversion complete!"
