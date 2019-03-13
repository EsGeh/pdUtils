#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

eval "$SCRIPTS_DIR/doc_exit.fish"
rm -rf "$BASE_DIR/dependencies"
