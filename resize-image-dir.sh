#!/bin/sh

mkdir resized

for f in `find . -name "*.jpg"`
do
    convert $f -resize 30% resized/$f
done
