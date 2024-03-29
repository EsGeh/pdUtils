#!/bin/fish

set BASE_DIR (realpath (status dirname)/..)
set SCRIPTS_DIR $BASE_DIR/scripts

if test ! -e $SCRIPTS_DIR/utils/cmd_args.fish
	echo "error: '$SCRIPTS_DIR/utils/cmd_args.fish' not found"
	exit 1
end

source $SCRIPTS_DIR/utils/cmd_args.fish

#################################################
# variables
#################################################

set LIB_NAME (basename $BASE_DIR)

# where to install:
set install_prefix "$HOME/.local/lib/pd/extra/"(dirname $BASE_DIR)
set debug 0

#################################################
# cmd line opts:
#################################################

# (syntax: short/long/description)
set options_descr \
	'h/help/print help' \
	"p/prefix=/where to install (default: '$install_prefix')" \
	"s/symlink/symlink pd patches" \
	'd/debug/compile for debugging'

#################################################
# functions
#################################################

function print_help
	echo "usage: "(status -f)" [OPTIONS...] [ARGS...]"
	echo "  build source code. ARGS are passed to make"
	echo "OPTIONS:"
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
else
	if set -q _flag_prefix
		set install_prefix (readlink -m $_flag_prefix)
	end
	if set -q _flag_symlink
		set symlink
	end
	if set -q _flag_debug
		set debug 1
	end
end

#################################################
# actual script
#################################################

# build
begin

	cd $BASE_DIR/

	set make_args $argv

	# make:
	set cmd make
	if test $install_prefix != ''
		set --append cmd PDLIBDIR=$install_prefix
	end
	if set --query symlink
		set --append cmd INSTALL_DATA='ln -s --relative'
	end
	if test $debug != 0
		set --append cmd 'optimization.flags=-DDEBUG -g' 
	end
	set --append cmd $make_args
	echo -e "executing: $cmd"
	$cmd
	or exit 1
end
