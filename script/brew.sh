#!/bin/sh

fomulaes="vim git stack peco ghq"

for fomulae in $fomulaes; do
  brew install $fomulae
done
