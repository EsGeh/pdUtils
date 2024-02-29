# sdUtils

Some puredata abstractions. Bits and pieces I use in puredata projects.
It has is designed in the spirit of the [structuredData](https://github.com/EsGeh/structuredData) library.

Some mentionable features:

- "sequencing"

	Events can be recorded and played back again.
	Events are messages structured in a specific way, as documented by the structuredData documentation.

## Dependencies

- [sdScript](https://github.com/EsGeh/sdScript)
- [structuredData](https://github.com/EsGeh/structuredData)
- [zexy](https://github.com/soundcloud/pd-zexy)

## Build Dependencies

- fish shell
- git
- autotools (only needed to build the dependencies)

## Initialize Project

init project (download dependencies, ...):

	$ ./scripts/init.fish

## Installation

	$ ./scripts/install.fish

Dependencies can be installed automatically too.
For details, append the `--help` option.

## Running

The library has to be added and to be in the search path.
Both can be done using cmd line arguments or in the ~/.pdsettings.

## Uninstall

No script provided. Just delete the install directory!

## Other scripts

- clean up downloaded dependencies, temporary files:

		$ ./scripts/exit.fish

## Documentation

The documentation is provided as a puredata example patch.
To see it, please install and run it, as described below:

### install docu

This installs all dependencies in some local folder.

	$ ./scripts/local_init.fish

### run docu

	$ ./scripts/local_run.fish

### uninstall docu

	$ ./scripts/local_exit.fish
