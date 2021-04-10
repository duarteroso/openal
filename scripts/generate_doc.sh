#!/bin/sh

mkdir al/docs
mkdir alc/docs

v doc -f md -o al/docs/ novuloj.vopenal.al
v doc -f md -o alc/docs/ novuloj.vopenal.alc

mv al/docs/al.md al/docs/README.md
mv alc/docs/alc.md alc/docs/README.md