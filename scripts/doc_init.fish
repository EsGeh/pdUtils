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

# (syntax: short/long/description)
set options_descr \
	'h/help/print help'

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

eval "$SCRIPTS_DIR/install.fish -l --no-subdirs --deps --dest '$doc_dir'"
