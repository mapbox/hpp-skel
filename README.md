Skeleton for C++ header-only libraries that can be included into other C++ projects.

[![Build Status](https://travis-ci.org/mapbox/hpp-skel.svg?branch=master)](https://travis-ci.org/mapbox/hpp-skel)

# What's in the box? :package:

* **Tests**: located in the `test/` directory and rely on `<cassert>`. Run tests with `make test`.
* **Documentation**: uses [cldoc](https://github.com/jessevdk/cldoc) to generate the `docs/` HTML pages. Build documentation with `make docs` (this will also install `cldoc`).
* **Deployment**: Ready to deploy `.hpp` files to [Mason Packaging](https://github.com/mapbox/mason).

# Usage

This repository itself is a helper library. To use it for a specific project, make sure to update the following information:

* Change the `include/` directory to a more relevant namespace for your project
* all occurances of Hello World (i.e. `test/unit/hello_world.cpp`) are just examples. Rename this files as appropriate.
* the `package.json` is included specifically if you'd like to publish your header files to NPM. If you intend to do this, update the information in that file.

# Test

```
make test
```

# Publish

We recommend publishing to [Mason](https://github.com/mapbox/mason), a C++ packaging manager that acts as a bucket for a number of project binaries. Binaries can be downloaded by project name and version number. In order to publish to Mason you must request the publish via a Pull Request to the [`scripts/` directory](https://github.com/mapbox/mason/tree/master/scripts) with your project materials.

Mason packages can be downloaded to your project by using the `mason install` command. This is best set up in a Makefile ([example](https://github.com/mapbox/geometry.hpp/blob/23b7fe66b11a4b7830c797817efe19660806d851/Makefile#L10)).

Of course, you can always copy and paste this repo into your vendor path for your project. :scissors:
