#!/bin/bash

echo "Downloading $1"
youtube-dl -f "best[height<=480]" $1

