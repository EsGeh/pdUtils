# sdUtils

Some puredata abstractions. Bits and pieces I use in puredata projects.
It has is designed in the spirit of the [structuredData](https://github.com/EsGeh/structuredData) library.

Some mentionable features:

- "sequencing"

	Events can be recorded and played back again.
	Events are messages structured in a specific way, as documented by the structuredData documentation.

## Dependencies

- fish shell
- [sdScript](https://github.com/EsGeh/sdScript)
- [structuredData](https://github.com/EsGeh/structuredData)
- other repositories. Please execute:

		$ ./scripts/init.fish

## Installation

Make shure you have all the dependencies installed.

1. To install the library, just issue:

	$ ./scripts/install.fish

	(for options append `--help`)

This will copy all necessary abstractions to the home directory.

2. add library to pd search path

	you have two options:

	- start pd from the command line like this:

			$ pd [-path <install_path>]

	- add this to `~/.pdsettings` :

			...
			path1: <install_path>
			...

	(manuall adjust the numbering!)

## Uninstall

No script provided yet

## Other scripts

- clean up downloaded dependencies, temporary files:

		$ ./scripts/exit.fish

## Documentation

The documentation is provided as a puredata example patch.
To see it, please install and run it, as described below:

### install docu

This installs all dependencies in some local folder.

	$ ./scripts/doc_init.fish

### run docu

	$ ./scripts/doc_run.fish

### uninstall docu

	$ ./scripts/doc_exit.fish
