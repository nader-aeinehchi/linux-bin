#!/bin/sh

# mkdir renamed
echo "Usage: rename-files.sh IMG john-img"
echo "Renaming: mv $1* $2*" 

find . -type f -name "*"  | xargs -r rename "s/$1/$2/"