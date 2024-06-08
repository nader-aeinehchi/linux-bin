#!/bin/sh

mkdir rotated

for f in `find . -name "*.pdf"`
do
	pdftk $f cat 1-endwest output rotated/$f
done
