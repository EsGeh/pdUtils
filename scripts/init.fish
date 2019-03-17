#!/bin/fish


set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))
set DEP_DIR_DEFAULT "$BASE_DIR/dependencies"

set fishshell_cmd_opts_version e446daf1741b416ecb83e4741b4cb7f99645bc11
set structureddata_version ffd30d8bddb0796a1d20784ed2f812b47b18a845
set sdscript_version ed944372af7777ae5defab820ed9a71e82a49796


# (syntax: short/long/description)
set options \
	'h/help' \
	"d/deps-dir="

#################################################
# functions
#################################################

function print_help
	echo "usage: "(status -f)" [OPTIONS...]"
	echo
	echo "OPTIONS:"
	echo "  -h | --help"
	echo "  -d | --deps-dir"
end

#################################################
# cmd line interface
#################################################

# parse command line arguments:
argparse $options -- $argv 2>/dev/null
or begin
	print_help
	exit 1
end
if set -q _flag_h
	print_help
	exit 0
else
	if set -q _flag_deps_dir
		set deps_dir $_flag_deps_dir
	end
end

#################################################
# actual script
#################################################

if set -q deps_dir
	set DEP_DIR $deps_dir
else
	set DEP_DIR $DEP_DIR_DEFAULT
end

mkdir -p -v $DEP_DIR

function is_up_to_date
	# check for fishshell-cmd-opts:
	if [ ! -d $DEP_DIR/fishshell-cmd-opts ]
		return 1
	end
	cd "$DEP_DIR"/fishshell-cmd-opts
	if [ (git rev-parse HEAD) != $fishshell_cmd_opts_version ]
		cd -
		return 1
	end
	cd -

	# check for structuredData:
	if [ ! -d $DEP_DIR/structuredData ]
		return 1
	end
	cd "$DEP_DIR"/structuredData
	if [ (git rev-parse HEAD) != $structureddata_version ]
		cd -
		return 1
	end
	cd -

	# check for sdScript:
	if [ ! -d $DEP_DIR/sdScript ]
		return 1
	end
	cd "$DEP_DIR"/sdScript
	if [ (git rev-parse HEAD) != $sdscript_version ]
		cd -
		return 1
	end
	cd -

	return 0
end

if is_up_to_date
	echo "all dependencies up to date!"
else
	if [ "$DEP_DIR" = "$DEP_DIR_DEFAULT" ]
		rm -rf -v $DEP_DIR
		mkdir -p -v $DEP_DIR

		cd "$DEP_DIR"
		# cmd line utils
		git clone git@github.com:EsGeh/fishshell-cmd-opts.git
		cd fishshell-cmd-opts/
		git checkout $fishshell_cmd_opts_version
		cd -

		# structuredData
		git clone git@github.com:EsGeh/structuredData.git
		cd structuredData
		git checkout $structureddata_version
		cd -

		# sdScript
		git clone git@github.com:EsGeh/sdScript.git
		cd sdScript
		git checkout $sdscript_version
		cd -
	else
		echo "WARNING: incompatible versions!"
	end
end

if [ $DEP_DIR != $DEP_DIR_DEFAULT ]
	rm $SCRIPTS_DIR/utils/cmd_args.fish
	ln -s (readlink -m $DEP_DIR/fishshell-cmd-opts/cmd_args.fish) $SCRIPTS_DIR/utils/cmd_args.fish
end
