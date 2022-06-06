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
	fa2229f2b05cc577aacb85c57105dcc5bdfd989c \
	"scripts/init.fish --deps-dir \$DEP_DIR"
