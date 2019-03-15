#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

set doc_dir $BASE_DIR/doc

pd \
	-noprefs \
	-path "$doc_dir" \
	-lib "structuredDataC" \
	-lib "sdScript" \
	"$doc_dir/pdUtils-help.pd"
