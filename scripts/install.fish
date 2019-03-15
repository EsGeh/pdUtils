#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))
set DEP_DIR $BASE_DIR/dependencies

source "$SCRIPTS_DIR/utils/cmd_args.fish"


#################################################
# variables
#################################################


set src $BASE_DIR/pd_objs
set install_dir "$HOME/.local/lib/pd/extra"
set rename '{}'

# (syntax: short/long/description)
set options_descr \
	"h/help/print help" \
	"l/link/don't copy files but create symbolic links instead" \
	"d/dest=/install dest (default: '$install_dir')" \
	"s/source=/source dir (default: '$src')" \
	"r/rename=/pattern for filenames on dest ({} is the basename on src). example: '\$(basename {} .pd)_ext.pd'" \
	"x-deps/also install dependencies" \
	"n/no-subdirs/no subdirs for specific libraries"

#################################################
# functions
#################################################

function print_help
	echo "usage: "(status -f)" [OPTIONS...]"
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
	if set -q _flag_dest
		set install_dir $_flag_dest
	end
	if set -q _flag_rename
		set rename $_flag_rename
	end
	if set -q _flag_link
		set copyCmd "ln -v -s"
	else
		set copyCmd "cp -v"
	end
	if set -q _flag_source
		set src $_flag_source
	end
	if set -q _flag_deps
		set install_deps $_flag_deps
	end
	if set -q _flag_no_subdirs
		set no_subdirs $_flag_no_subdirs
	end
end

if not set -q no_subdirs
	set install_dest "$install_dir/pdUtils"
else
	set install_dest "$install_dir"
end

# make '{}' to refer to the (basename {})
set rename (string replace --regex --all -- '{}' '\\\$(basename {})' "$rename")

set copyCmd (string join -- ' ' $copyCmd '"{}"' "\"$install_dest/$rename\"")

#################################################
# actual script
#################################################

echo "src dir: '$src'"
echo "install dest: '$install_dest'"
echo "copyCmd: $copyCmd"

mkdir -v -p $install_dest

find "$src" \
	\( \
		-type f \
		-o \
		-type l \
	\) \
	\( \
		-name '*.pd' \
		-o \
		-name '*.script' \
	\) \
	-exec /bin/bash -c "$copyCmd" \;

# dependencies:
if set -q install_deps
	# structuredData:
	if not set -q no_subdirs
		set current_dest "$install_dir/structuredData"
	else
		set current_dest "$install_dir"
	end
	echo "installing structuredData into '$current_dest'"
	and eval "$DEP_DIR/structuredData/scripts/init.fish"
	and eval "$DEP_DIR/structuredData/scripts/build.fish --prefix '$current_dest' install"

	# sdScript:
	if not set -q no_subdirs
		set current_dest "$install_dir/sdScript"
	else
		set current_dest "$install_dir"
	end
	echo "installing sdScript into '$current_dest'"
	and eval "$DEP_DIR/sdScript/scripts/init.fish"
	and eval "$DEP_DIR/sdScript/scripts/build.fish --prefix '$current_dest' install"
end
