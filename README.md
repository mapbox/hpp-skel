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
Easily use this skeleton as a starting off point.

### Start new project
```
# Clone hpp-skel locally

git clone git@github.com:mapbox/hpp-skel.git
cd hpp-skel/

# Create your new repo on GitHub and have the remote repo url handy for liftoff
# Then run the liftoff script from within your local hpp-skel root directory.
#
# This will:
# - prompt you for the new name of your project and the new remote repo url
# - automatically create a new directory for your new project repo
# - create a new branch called "hpp-skel-port" within your new repo directory
# - add, commit, and push that branch to your new repo

./scripts/liftoff.sh

```

### Add custom code
Once your project has ported hpp-skel, follow these steps to integrate your own code:

- Create a dir in `./include` to hold your custom code. See the example code within [`./include`](https://github.com/mapbox/hpp-skel/tree/master/include) for reference.
- Create a new file within your new directory, and add your custom method or class.
- Create a module header file (see [hello_world.hpp](https://github.com/mapbox/hpp-skel/blob/master/include/hello_world.hpp)), and `#include` your new method or class. Make sure this file matches the name of the directory you created in the first step above.
- Run `make` and see what surprises await on your new journey :boat:
- If it compiles succesfully, congrats :tada: If not, dont fret. Take a breath and read the error message.
- To start putting your header lib to work, setup a test to make sure it is working as expected. 

### Setup tests
Since header-only libraries are _not_ normally compiled themselves, to test them you need to [#include](https://github.com/mapbox/cpp/blob/master/glossary.md#include) them in a `.cpp` file (aka a [translation unit](https://github.com/mapbox/cpp/blob/master/glossary.md#translation-unit)) to compile and run their code. We recommend using [Catch](https://github.com/catchorg/Catch2) to make writing this `.cpp` file easy.

- Create a file in `/test` directory, and add the following (be sure to update relevant lines with the name of the header you created above):
``` cpp
#include <your_header_here.hpp>
#define CATCH_CONFIG_MAIN
#include <catch.hpp>

TEST_CASE("test_my_header")
{
    // Your test logic here
}
```
- Fill in the TEST_CASE with relevant [Catch](https://github.com/catchorg/Catch2) logic (see [test.cpp](https://github.com/mapbox/hpp-skel/blob/master/test/test.cpp) for examples).
- Tip: When calling your header method/class, make sure the namespace matches your header. For example
``` cpp
// "hello_world" is the namespace
// "exclaim" is the method 

std::string value = hello_world::exclaim("hello");
```
- Run `make test` to compile and run your test

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
