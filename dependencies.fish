#!/bin/fish

########################################
# dependencies of this repository
########################################

set dependencies \
	fishshell_cmd_opts \
	structuredData \
	pd_lib_builder

# for every entry in $dependencies:
# 	name uri version
set fishshell_cmd_opts \
	fishshell-cmd-opts  \
	https://github.com/EsGeh/fishshell-cmd-opts.git \
	e446daf1741b416ecb83e4741b4cb7f99645bc11

set structuredData \
	structuredData \
	https://github.com/EsGeh/structuredData.git \
	edb67f3ae082da68e624a9683f63935383b8074b \
	"scripts/init.fish --deps-dir \$DEP_DIR"

set pd_lib_builder \
	pd-lib-builder \
	https://github.com/pure-data/pd-lib-builder.git \
	77525265694bac50ed94c5ef62ebbae680c72ab0
