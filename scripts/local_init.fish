#!/bin/fish

set BASE_DIR (realpath (status dirname)/..)
set SCRIPTS_DIR $BASE_DIR/scripts
set DEP_DIR $BASE_DIR/dependencies

set LIB_NAME (basename $BASE_DIR)

if test ! -e $SCRIPTS_DIR/utils/cmd_args.fish
	echo "error: dependencies not installed!"
	exit 1
end

source $SCRIPTS_DIR/utils/cmd_args.fish

#################################################
# variables
#################################################

set doc_dir $BASE_DIR/doc
set symlink 0

#################################################
# cmd line opts:
#################################################

# (syntax: short/long/description)
set options_descr \
	'h/help/print help' \
	"s/symlink/symlink pd patches"

#################################################
# functions
#################################################

function print_help
	echo "install library and dependencies locally into '$doc_dir'"
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
else
	if set -q _flag_symlink
		set symlink 1
	end
end

#################################################
# actual script
#################################################

and begin
	set cmd $SCRIPTS_DIR/build.fish 
	set --append cmd "--prefix" "$doc_dir"
	if test $symlink = 1
		set --append cmd '--symlink'
	end
	set --append cmd install
	echo "executing: '$cmd'"
	$cmd
end
or begin
	echo "ERROR installing $LIB_NAME!"
	exit 1
end

# dependencies:

# structuredData:
begin
	echo "installing structuredData into '$doc_dir'"
	set cmd $DEP_DIR/structuredData/scripts/build.fish --prefix "$doc_dir" install
	echo "executing: '$cmd'"
	$cmd
end
or begin
	echo "ERROR installing structuredData!"
	exit 1
end

# zexy:
begin
	echo "installing zexy into '$doc_dir'"
	cd $DEP_DIR/zexy
	set cmd make PDLIBDIR="$doc_dir" install
	echo "executing: '$cmd'"
	$cmd
	cd -
end
or begin
	echo "ERROR installing zexy!"
	exit 1
end
