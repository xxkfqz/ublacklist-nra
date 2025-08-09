#!/bin/bash

set -e

LIST_NAME="ublacklist-nra.txt"
TMP=$(mktemp)

perl -pe 's/^\*:\/\/(?!\*\.)/\*:\/\/\*\./g' < "$LIST_NAME" | perl -pe 's/(?<=\.)(.+?)\.(.+?)\.(.+?)(?=\/)/\2\.\3/g' > "$TMP"
sort < "$TMP" | uniq > "$LIST_NAME"
git --no-pager diff "$LIST_NAME"
rm "$TMP"
