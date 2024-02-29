#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))
set DEP_DIR "$BASE_DIR/dependencies"

eval "$SCRIPTS_DIR/local_exit.fish"
rm -rf "$DEP_DIR"
