#!/local/bin/env bash

set -ex
pkgs=(
  markdown-preview-opener
  atom-tidy-markdown
  atom-csv-markdown
  )

for i in ${!pkgs[*]}
do
  local pkg=${pkgs[$i]}
  apm install $pkg;
done

