Skeleton for C++ header-only libraries that can be included into other C++ projects.

# What's in the box? :package:

* **Tests**: located in the `test/` directory and rely on `<cassert>`.
* **Build system**: Makefile with pre-rigged commands to move quickly.
* **Deployment**: Ready to deploy `.hpp` files to NPM and/or [Mason Packaging](https://github.com/mapbox/mason)

# Usage

This repository itself is a helper library. To use it for a specific project, make sure to update the following information:

* Change the `include/mapbox` directory to a more relevant namespace for your project
* all occurances of Hello World (i.e. `test/unit/hello_world.cpp`) are just examples. Rename this files as appropriate.
* the `package.json` is included specifically if you'd like to publish your header files to NPM. If you intend to do this, update the information in that file.

# How do I include a C++ header library?

In general, there are three ways to include a header library such as this one:

1. Publish to NPM and include the project in your `package.json` & point your build to the `node_modules/library/include` folder.
2. Publish to Mason Packaging which allows binaries to be accessed with the Mason CLI or directly with the S3 URL.
3. Copy & paste the header from this repo directly into your vendor path for your project.