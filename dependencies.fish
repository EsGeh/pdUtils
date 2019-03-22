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
	git@github.com:EsGeh/fishshell-cmd-opts.git	\
	e446daf1741b416ecb83e4741b4cb7f99645bc11
set structuredData \
	structuredData \
	git@github.com:EsGeh/structuredData.git	\
	7e477e308a551bd8e139d233ed2730a419b3ee0d \
	"scripts/init.fish --deps-dir \$DEP_DIR"
set sdScript \
	sdScript \
	git@github.com:EsGeh/sdScript.git	\
	ed944372af7777ae5defab820ed9a71e82a49796 \
	"scripts/init.fish --deps-dir \$DEP_DIR"
