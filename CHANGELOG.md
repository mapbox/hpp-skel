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
