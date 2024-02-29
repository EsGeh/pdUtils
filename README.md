# sdUtils

Utility objects to be used with the [puredata](https://puredata.info/) computer music software.
The structure of this library is based on design principles introduced by the [structuredData](https://github.com/EsGeh/structuredData) library.

# Features:

- Sequencing

	Events can be recorded and played back again.
	Events are messages structured in a specific way, as documented by the structuredData documentation.

- Utility audio objects

    Little helper objects for audio level control.
    Little audio control objects with integrated gui sliders.

## Dependencies

- [sdScript](https://github.com/EsGeh/sdScript)
- [structuredData](https://github.com/EsGeh/structuredData)
- [zexy](https://github.com/soundcloud/pd-zexy)

## Prerequisits

- [fish shell](https://fishshell.com/)
- [puredata](https://puredata.info/): the famous computer music software

## Project setup

- Initialise project (download dependencies, ...):

		$ ./scripts/init.fish
	
	This will download and git dependencies into `./dependencies/`

- Clean project

		$ ./scripts/exit.fish

## Test locally without installing to system

1. Install library to a local dir

		$ ./scripts/local_init.fish

2. Run Example

		$ ./scripts/local_run.fish

	This opens an example patch documenting the major parts of this library.

3. Uninstall library from the local dir

		$ ./scripts/local_exit.fish

## Installation

- Build and install:

        $ ./scripts/build.fish install

    (for options append `--help`)

- Configure pd to find abstractions

	start pd and add `<install_location>/pdUtils` under `File -> Settings -> Path -> New`

- Make sure the [dependencies](#dependencies) are installed. Please refer to the corresponding documentation of these libraries.

## Documentation

The Documentation is provided as puredata example patches accessible in pd under `Help -> Patch Browser -> structuredDataC`.
Alternatively, for help with a specific object, right click on it and select "help".
