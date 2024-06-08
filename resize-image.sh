#!/bin/sh

for f in `find . -name "*.jpg"`
do
    convert $f -resize 50% $f.resized.jpg
done
