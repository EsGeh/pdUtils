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
	2b868172e7028182cdeb0fe94ee1f061e54ffcb0 \
	"scripts/init.fish --deps-dir \$DEP_DIR"
set sdScript \
	sdScript \
	https://github.com/EsGeh/sdScript.git \
	dc8c529af4345bdf6cf59c37ff4b013f0f5a2683 \
	"scripts/init.fish --deps-dir \$DEP_DIR"
