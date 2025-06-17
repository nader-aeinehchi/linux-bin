#!/bin/bash

# Prompt the user for the desired filename
read -p "Enter the filename to save the image as (e.g., screenshot.png): " filename

# Check if the filename is empty
if [ -z "$filename" ]; then
  echo "Filename cannot be empty. Please try again."
  exit 1
fi

# Attempt to save the clipboard image using xclip
if command -v xclip >/dev/null 2>&1; then
  echo "Attempting to save clipboard image using xclip..."
  # Try saving as PNG first (most common for clipboard images)
  xclip -selection clipboard -t image/png -o > "$filename".png 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Image saved successfully as '$filename' (PNG)."
    exit 0
  fi
  # If PNG fails, try JPEG (another common format)
  xclip -selection clipboard -t image/jpeg -o > "$filename".png 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Image saved successfully as '$filename' (JPEG)."
    exit 0
  fi
  echo "Failed to save clipboard image using xclip. Ensure an image is in your clipboard and the format is common (PNG or JPEG)."
fi

# Attempt to save the clipboard image using import (ImageMagick) as a fallback
if command -v import >/dev/null 2>&1; then
  echo "Attempting to save clipboard image using import (ImageMagick)..."
  # This method usually captures a selection, so we'll guide the user
  echo "Please select a region on your screen to save as '$filename.png'"
  import "$filename".png
  if [ $? -eq 0 ]; then
    echo "Image saved successfully as '$filename'.png"
    exit 0
  else
    echo "Failed to save image using import."
  fi
fi

# If neither tool is available
echo "Neither 'xclip' nor 'imagemagick' (specifically 'import') are installed."
echo "Please install one of these tools to save images from the clipboard."
echo "You can install them using:"
echo "  sudo apt update"
echo "  sudo apt install xclip imagemagick"

exit 1
