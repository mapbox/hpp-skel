Skeleton for C++ header-only libraries that can be included into other C++ projects. This repository itself is a helper library. To use it for a specific project, edit filenames and tests accordingly.

[![Build Status](https://travis-ci.org/mapbox/hpp-skel.svg?branch=master)](https://travis-ci.org/mapbox/hpp-skel)
[![codecov](https://codecov.io/gh/mapbox/hpp-skel/branch/master/graph/badge.svg)](https://codecov.io/gh/mapbox/hpp-skel)

![dancing skel](https://mapbox.s3.amazonaws.com/cpp-assets/hpp-skel-readme_blue.png)

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

# run bench tests
make bench
```

The default test binaries will be built in release mode. You can make Debug test binaries as well:

```shell
make clean
make debug
make test
```

Enable additional sanitizers to catch hard-to-find bugs, for example:

```shell
export LDFLAGS="-fsanitize=address,undefined,integer"
export CXXFLAGS="-fsanitize=address,undefined,integer"

make
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

## Benchmarks
This skeleton uses [Google Benchmark](https://github.com/google/benchmark) to measure performance, and includes a [couple benchmark tests](https://github.com/mapbox/hpp-skel/blob/master/bench/run.cpp) to get you up and running quickly:
- `BM_exlaim()`: Pretty barebone, simply testing string creation
- `BM_expensive()`: Expensive allocation of std::map, querying, and string comparison, therefore threads are busy. This benchmark accepts an arg to specify amount of work you'd like the script to do (how big the map will be, how many times to convert an int to a string, and how many times to run the map lookup)

#### Some notes on Google Benchmark results:
- Number of Iterations is automatically set, based on how many iterations it takes to obtain sufficient data for the bench.
- Results provide both wall time and CPU time. You may notice, the more threads used for the expensive code (up until the number of available cores on the machine), the longer CPU time will be and the shorter wall time will be. This is because the more code is shared between threads, the faster it can run in total time; the more threads doing work, the more processes running, therefore longer CPU time.

#### Compiler Optimization
To obtain a true benchmark, it may be necessary to prevent the compiler from optimizing away a value or expression. The skeleton uses Google Benchmark's internal functions to manage this. See https://github.com/google/benchmark#preventing-optimisation for more details.

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

# Contributing and License

Contributors are welcome! :sparkles: This repo exists as a place to gather C++ Header Library knowledge that will benefit the larger community. Please contribute your knowledge if you'd like.

hpp-skel is licensed under [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/). Attribution is not required, but definitely welcome! If your project uses this skeleton, please add the hpp-skel badge to your readme so that others can learn about the resource.

[![badge](https://mapbox.s3.amazonaws.com/cpp-assets/hpp-skel-badge_blue.svg)](https://github.com/mapbox/hpp-skel)

To include the badge, paste this into your README.md file:
```
[![badge](https://mapbox.s3.amazonaws.com/cpp-assets/hpp-skel-badge_blue.svg)](https://github.com/mapbox/hpp-skel)
```

See [CONTRIBUTING](CONTRIBUTING.md) and [LICENSE](LICENSE.md) for more info.
