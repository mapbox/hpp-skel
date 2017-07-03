Skeleton for C++ header-only libraries that can be included into other C++ projects. This repository itself is a helper library. To use it for a specific project, edit filenames and tests accordingly.

[![Build Status](https://travis-ci.org/mapbox/hpp-skel.svg?branch=master)](https://travis-ci.org/mapbox/hpp-skel)

# Usage

```cpp
#include <include/hello_world/hello_world.hpp>

using namespace hello_world;

// exclaim a string
std::string value = exclaim("hello");
std::clog << value; // => hello!
```

# Test

```shell
make test
# test_exclaim ... success
```

# Publish

We recommend publishing to [Mason](https://github.com/mapbox/mason), a C++ packaging manager that acts as a bucket for a number of project binaries. Binaries can be downloaded by project name and version number. In order to publish to Mason you must request the publish via a Pull Request to the [`scripts/` directory](https://github.com/mapbox/mason/tree/master/scripts) with your project materials.

Mason packages can be downloaded to your project by using the `mason install` command. This is best set up in a Makefile ([example](https://github.com/mapbox/geometry.hpp/blob/23b7fe66b11a4b7830c797817efe19660806d851/Makefile#L10)).

Of course, you can always copy and paste this repo into your vendor path for your project. :scissors:
