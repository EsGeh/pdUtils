#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

set doc_dir $BASE_DIR/doc

pd \
	-noprefs \
	-jack \
	-path "$doc_dir" \
	-lib "zexy" \
	-lib "structuredDataC" \
	-lib "sdScript" \
	"$doc_dir/pdUtils-help.pd"
