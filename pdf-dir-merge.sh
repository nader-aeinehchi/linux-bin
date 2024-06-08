#!/bin/sh

myPdfs=$(ls *.pdf)

echo $myPdfs

pdfunite $myPdfs output.pdf
