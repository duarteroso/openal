#!/bin/sh

rm -rf ../docs
mkdir ../docs
mkdir ../docs/al
mkdir ../docs/alc

v doc -f md -o ../docs/al duarteroso.vopenal.al
v doc -f md -o ../docs/alc duarteroso.vopenal.alc

mv ../docs/al/*.md ../docs/al/README.md
mv ../docs/alc/*.md ../docs/alc/README.md