# vNext

* move include directory up a level, now just /include/hello_world.cpp
* update test directory structure to just use test.cpp instead of splitting into unit tests
* default to Debug build, standardize build location to /build/Release and /build/Debug [#18](https://github.com/mapbox/hpp-skel/issues/18)
* `make` command builds by default, tests are run with `make test`
* add a version file [#19](https://github.com/mapbox/hpp-skel/issues/19)

compare: https://github.com/mapbox/hpp-skel/compare/v1.0.0...v2.0.0

# 1.0.0

* nest hello_world within include directory named after library

compare: https://github.com/mapbox/hpp-skel/compare/v0.0.2...v1.0.0

# 0.0.2

*	add debug/release builds + more aggressive warnings
*	default to Release
* Create test alias
*	c++11 as default
* add `include_dirs.js` for NPM publishing and requiring

compare: https://github.com/mapbox/hpp-skel/compare/v0.0.1...v0.0.2

# 0.0.1

* first
