#!/bin/bash

/opt/homebrew/bin/fzf -m --prompt='Choose a file to attach >' | \
while IFS=$'\n' read -r attachment; do
  echo "push 'a$attachment<enter>'"
done
