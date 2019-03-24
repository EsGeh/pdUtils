#!/bin/fish

########################################
# dependencies of this repository
########################################

set dependencies \
	fishshell_cmd_opts \
	structuredData \
	sdScript 

# for every entry in $dependencies:
# 	name uri version
set fishshell_cmd_opts \
	fishshell-cmd-opts  \
	https://github.com/EsGeh/fishshell-cmd-opts.git \
	e446daf1741b416ecb83e4741b4cb7f99645bc11
set structuredData \
	structuredData \
	https://github.com/EsGeh/structuredData.git \
	e1dab38dcc65728c54b6cf1e633cc8c8664276a7 \
	"scripts/init.fish --deps-dir \$DEP_DIR"
set sdScript \
	sdScript \
	https://github.com/EsGeh/sdScript.git \
	27bf45ae9c4c6dce3f5c545f1bffaaab4baca515 \
	"scripts/init.fish --deps-dir \$DEP_DIR"
