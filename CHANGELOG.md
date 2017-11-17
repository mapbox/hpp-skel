# 11/17/2017

* Update contributing and changelog

# 11/16/2017

* Liftoff [docs and fix](https://github.com/mapbox/hpp-skel/pull/57)
* ]iwyu fix](https://github.com/mapbox/hpp-skel/pull/59)

# 10/30/2017

* [Add docs](https://github.com/mapbox/hpp-skel/pull/56/files) for how to set sanitizer flags

# 10/23/2017

* Do not [sort includes with clang format](https://github.com/mapbox/hpp-skel/pull/55)

# 10/20/2017

* Add [CC0 license](https://github.com/mapbox/hpp-skel/pull/54)

# 10/17/2017

* Add better [default warnings](https://github.com/mapbox/hpp-skel/pull/52) and update compiler flags per https://github.com/mapbox/cpp/issues/37#issuecomment-336200744

# 10/12/2017

* Add compiler flags/warnings per https://github.com/mapbox/cpp/issues/37

# 09/12/2017

* Add multithread benchmarking:
* inline headers
* collapse both benchmarks into one run.cpp
* call binary directly from Makefile
* [add ignores to codecov](https://github.com/mapbox/hpp-skel/pull/49)
* [clang format fixes](https://github.com/mapbox/hpp-skel/pull/50)
* Add clant-tidy NOLINT
* anti-optimization and clobber methods

# 08/25/2017

* Add clang-format
* Transition tests to use catch
* [Port to cmake](https://github.com/mapbox/hpp-skel/pull/24)
* [Add setup.sh and local coverage reporting](https://github.com/mapbox/hpp-skel/pull/27)
* Add [first iteration](https://github.com/mapbox/hpp-skel/pull/29) of "liftoff" script
* [Glob tests in cmake](https://github.com/mapbox/hpp-skel/pull/30) for added flexibility 
* [Disable OSX testing](https://github.com/mapbox/hpp-skel/pull/35) for now

# 08/23/2017

* move include directory up a level, now just /include/hello_world.cpp
* update test directory structure to just use test.cpp instead of splitting into unit tests
* default to Debug build, standardize build location to /build/Release and /build/Debug [#18](https://github.com/mapbox/hpp-skel/issues/18)
* `make` command builds by default, tests are run with `make test`
* add a version file [#19](https://github.com/mapbox/hpp-skel/issues/19)

## 08/25/2016

* nest hello_world within include directory named after library

## 08/18/2016

*	add debug/release builds + more aggressive warnings
*	default to Release
* Create test alias
*	c++11 as default
* add `include_dirs.js` for NPM publishing and requiring

## 07/20/2016

* the hpp-skel is born :baby:
