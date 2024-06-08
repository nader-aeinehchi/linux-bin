#!/bin/bash

echo "Downloading $1"
youtube-dl -f "best[height<=480]" "http://www.youtube.com/view_play_list?p=$1"

