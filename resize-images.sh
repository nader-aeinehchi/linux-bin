#!/bin/sh
echo "Usage: resize-files.sh file-type percentage"
echo "Resizing *.$1 files to $2% of original size" 

find -name "*.$1" | xargs -I {} convert "{}" -resize $2% "{}"
