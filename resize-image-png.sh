#!/bin/sh

for f in `find . -name "*.png"`
do
    convert $f -resize 70% $f.resized.png
done
