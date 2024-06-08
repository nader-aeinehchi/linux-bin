#!/bin/sh

mkdir $HOME/scala/cs
cd $HOME/scala/cs
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs
chmod u+x cs
./cs setup
