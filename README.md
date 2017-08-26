Skeleton for C++ header-only libraries that can be included into other C++ projects. This repository itself is a helper library. To use it for a specific project, edit filenames and tests accordingly.

[![Build Status](https://travis-ci.org/mapbox/hpp-skel.svg?branch=master)](https://travis-ci.org/mapbox/hpp-skel)
[![codecov](https://codecov.io/gh/mapbox/hpp-skel/branch/master/graph/badge.svg)](https://codecov.io/gh/mapbox/hpp-skel)

## Usage

```cpp
#include <include/hello_world.hpp>

using namespace hello_world;

// exclaim a string
std::string value = exclaim("hello");
std::clog << value; // => hello!
```

## Test

```shell
# build test binaries
make

# run tests
make test
```

The default test binaries will be built in release mode. You can make Debug test binaries as well:

```shell
make clean
make debug
make test
```

## Customize
Easily use this skeleton as a starting off point for your own custom project:

```
# Clone hpp-skel locally
git clone git@github.com:mapbox/hpp-skel.git
cd hpp-skel/

# Create your new repo on GitHub and have the remote repo url handy for liftoff
# Then run the liftoff script from within your local hpp-skel root directory.
#
# This will:
# - prompt you for the new name of your project and the new remote repo url
# - automatically rename your local hpp-skel directory to the name of your project
# - create a new branch called "hpp-skel-port"
# - add, commit, and push
./scripts/liftoff.sh

```

## Publishing

We recommend publishing header files to [Mason](https://github.com/mapbox/mason), the C++ packaging manager. Binaries can be downloaded by project name and version number. In order to publish to Mason you must request the publish via a Pull Request to the [`scripts/` directory](https://github.com/mapbox/mason/tree/master/scripts) with your project materials.

Mason packages can be downloaded to your project by using the `mason install` command. This is best set up in a Makefile ([example](https://github.com/mapbox/geometry.hpp/blob/23b7fe66b11a4b7830c797817efe19660806d851/Makefile#L10)).

Of course, you can always copy and paste this repo into your vendor path for your project. :scissors:

## Versioning

This library is semantically versioned using the /include/hello_world/version.cpp file. This defines a number of macros that can be used to check the current major, minor, or patch versions, as well as the full version string.

Here's how a downstream client would check for a particular version to use specific API methods
```cpp
#if HELLOWORLD_VERSION_MAJOR > 2
// use version 2 api
#else
// use older verion apis
#endif
```

Here's how to check the version string
```cpp
std::cout << "version: " << HELLOWORLD_VERSION_STRING << "/n";
// => version: 0.2.0
```

And lastly, mathematically checking for a specific version:
```cpp
#if HELLOWORLD_VERSION_CODE > 20001
// use feature provided in v2.0.1
#endif
```
