#!/usr/bin/env bash
if [ -z "$(command -v pikaur)" ]; then
  exit
fi

rm -rf ~/.cache/pikaur/build
mkdir -p /tmp/pikaur_cache
ln -s /tmp/pikaur_cache ~/.cache/pikaur/build
