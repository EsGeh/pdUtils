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
	ad27977ea4345defabc13358ec0cffd5094721b6 \
	"scripts/init.fish --deps-dir \$DEP_DIR"
set sdScript \
	sdScript \
	https://github.com/EsGeh/sdScript.git \
	92b6704725d4493f94c7beb634100d01a6d1272d \
	"scripts/init.fish --deps-dir \$DEP_DIR"
