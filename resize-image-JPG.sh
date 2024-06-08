#!/bin/sh

for f in `find . -name "*.jpg"`
do
    convert $f -resize 30% $f.resized.jpg
done
