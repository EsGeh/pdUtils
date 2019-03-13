#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

#################################################
# variables
#################################################

set doc_dir "$BASE_DIR/doc"

# where to install:
set install "$doc_dir/install"
set install_sd "$doc_dir/install_sd"
set install_sdscript "$doc_dir/install_sdscript"

rm -rf "$install"
rm -rf "$install_sd"
rm -rf "$install_sdscript"
