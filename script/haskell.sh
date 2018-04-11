#!/bin/bash 
DEP="ghc-mod hasktags codex hscope pointfree pointful hoogle stylish-haskell hindent hdevtools"

for dep in $DEP; do
  printf "install %s\n" $dep
  stack install $dep
done
