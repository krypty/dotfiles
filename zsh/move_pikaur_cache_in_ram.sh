#!/usr/bin/env bash

rm -rf ~/.cache/pikaur/build
mkdir -p /tmp/pikaur_cache
ln -s /tmp/pikaur_cache ~/.cache/pikaur/build
