#!/bin/fish

########################################
# dependencies of this repository
########################################

set dependencies \
	fishshell_cmd_opts \
	structuredData

# for every entry in $dependencies:
# 	name uri version
set fishshell_cmd_opts \
	fishshell-cmd-opts  \
	https://github.com/EsGeh/fishshell-cmd-opts.git \
	e446daf1741b416ecb83e4741b4cb7f99645bc11

set structuredData \
	structuredData \
	https://github.com/EsGeh/structuredData.git \
	ebe80c07ffd9884fadbb831a06580c121c5910ae \
	"scripts/init.fish --deps-dir \$DEP_DIR"
