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
	ffd30d8bddb0796a1d20784ed2f812b47b18a845
set sdScript \
	sdScript \
	git@github.com:EsGeh/sdScript.git	\
	ed944372af7777ae5defab820ed9a71e82a49796
