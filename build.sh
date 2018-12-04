#!/bin/bash

PLANTUML=~/Downloads/plantuml.jar

# for filename in `ls src/*uml`; do

for filename in `find src/ -type f -mmin -360 | grep uml`; do
  echo "Building $filename"
  java -jar $PLANTUML -v -tpng $filename -o ../out/;
done


