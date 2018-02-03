
# Whether to turn compiler warnings into errors
export WERROR ?= true
export BUILD_DIR ?= cmake-build
CC := $(CC)
CXX := $(CXX)

default: release

local.env:
	./scripts/setup.sh --config local.env

mason_packages: local.env
	.mason/mason install build2 0.6.2
	.mason/mason link build2 0.6.2
	.mason/mason install catch 1.9.6
	.mason/mason link catch 1.9.6
	.mason/mason install benchmark 1.2.0
	.mason/mason link benchmark 1.2.0

release: mason_packages
	mason_packages/.link/bin/b -v config.cxx=$(CXX) config.cxx.coptions="-O3 -DNDEBUG"

debug: mason_packages
	mason_packages/.link/bin/b -v config.cxx=$(CXX) config.cxx.coptions="-O0 -g -DDEBUG"

test: debug
	mason_packages/.link/bin/b test

bench: release
	./bench/run

tidy:
	./scripts/clang-tidy.sh

coverage:
	./scripts/coverage.sh

clean:
	mason_packages/.link/bin/b clean

distclean:
	rm -rf mason_packages
	rm -rf .mason
	rm -rf .toolchain
	rm -rf local.env

format:
	./scripts/format.sh

tree:
	rm -rf /tmp/hpp-skel-build
	bpkg create -d /tmp/hpp-skel-build
	bpkg build -d /tmp/hpp-skel-build ./
	bpkg test -d /tmp/hpp-skel-build hpp-skel

tree-clean:
	bpkg clean -d /tmp/hpp-skel-build hpp-skel

.PHONY: test bench