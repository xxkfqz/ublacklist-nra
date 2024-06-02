#!/bin/bash

set -e

LIST_NAME="ublacklist-nra.txt"
TMP=$(mktemp)

cat "$LIST_NAME" > "$TMP"
sort < "$TMP" | uniq > "$LIST_NAME"
git --no-pager diff "$LIST_NAME"
