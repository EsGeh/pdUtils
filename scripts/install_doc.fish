#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

if test ! -e $SCRIPTS_DIR/utils/cmd_args.fish
	echo "error: dependencies not installed!"
	exit 1
end

source $SCRIPTS_DIR/utils/cmd_args.fish

#################################################
# variables
#################################################

set doc_dir $BASE_DIR/doc

# where to install:
set install "$doc_dir/install"
set install_legacy "$doc_dir/install_legacy"
set install_sd "$doc_dir/install_sd"
set install_sdscript "$doc_dir/install_sdscript"

# (syntax: short/long/description)
set options_descr \
	'h/help/print help'

set cmds build install

#################################################
# functions
#################################################

function print_help
	echo "install to '$doc_dir'"
	echo "USAGE: "(status -f)
	print_options_descr $options_descr
end

#################################################
# cmd line interface
#################################################

set options (options_descr_to_argparse $options_descr)

# parse command line arguments:
argparse $options -- $argv 2>/dev/null
or begin
	print_help
	exit 1
end
if set -q _flag_h
	print_help
	exit 0
end

#################################################
# actual script
#################################################

# install objs
eval "$SCRIPTS_DIR/install.fish --link --dest '$install'"

# install legacy obj
eval "$BASE_DIR/dependencies/structuredData/legacy/scripts/install.fish --link --dest '$install_legacy'"

# install structuredData
cd "$BASE_DIR/dependencies/structuredData/c"
eval "$BASE_DIR/dependencies/structuredData/c/scripts/run_autotools.fish"
cd -

eval "$BASE_DIR/dependencies/structuredData/c/scripts/build.fish build install --prefix '$install_sd'"

# install sdScript:
cd "$BASE_DIR/dependencies/sdScript"
eval "$BASE_DIR/dependencies/sdScript/scripts/run_autotools.fish"
cd -
eval "$BASE_DIR/dependencies/sdScript/scripts/build.fish build install --prefix '$install_sdscript'"
