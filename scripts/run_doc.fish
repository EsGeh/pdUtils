#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

set doc_dir $BASE_DIR/doc

# where to install:
set install "$doc_dir/install"
set install_legacy "$doc_dir/install_legacy"
set install_sd "$doc_dir/install_sd"
set install_sdscript "$doc_dir/install_sdscript"


pd -noaudio \
	-noprefs \
	-path "$install" \
	-path "$install_legacy" \
	-path "$install_sd" \
	-path "$install_sdscript" \
	-lib "structuredDataC" \
	-lib "sdScript" \
	"$doc_dir/sequencing_doc.pd"
