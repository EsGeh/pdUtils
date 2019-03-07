#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..

rm -rf "$BASE_DIR/dependencies"
