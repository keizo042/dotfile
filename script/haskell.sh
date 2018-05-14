#!/bin/bash 
DEPS="ghc-mod hasktags codex hscope pointfree pointful hoogle stylish-haskell hindent hdevtools"
RESOLVER="lts-8.20"

for dep in $DEPS; do
  printf "install %s\n" $dep
  stack install --resolver $RESOLVER $dep
done
