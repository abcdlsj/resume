#!/bin/bash

rm -f *.pdf

files=("resume-cn" "resume-cn-en" "resume-en")
echo "Generating..."

for f in "${files[@]}"; do
  {
    echo '#import "main.typ": *;'
    echo '#show: cv'
  } > "$f.typ"
done

echo '#runReader(Chinese)' >> "resume-cn.typ"
echo '#runReader(English)' >> "resume-en.typ"
echo '#runReader(Chinese)' >> "resume-cn-en.typ"
echo '#newpage' >> "resume-cn-en.typ"
echo '#runReader(English)' >> "resume-cn-en.typ"

for f in "${files[@]}"; do
  echo "Building $f.typ"
  typst compile "$f.typ"
  rm "$f.typ"
done
