#!/bin/sh

# Create one single manifest file
target="./manifests-all.yaml"
if [ -f "$target" ]; then
  rm "$target"
fi
echo "# Derived from ./manifests" >> "$target"
for file in $(find ./manifests -type f -name "*.yaml" | sort) ; do
  echo "---" >> "$target"
  cat "$file" >> "$target"
done
