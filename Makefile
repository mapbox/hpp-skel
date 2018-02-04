
# Whether to turn compiler warnings into errors
export WERROR ?= true
export BUILD_DIR ?= cmake-build
CC := $(CC)
CXX := $(CXX)

default: release

local.env:
	./scripts/setup.sh --config local.env

mason_packages: local.env
	.mason/mason install build2 0.7.0-a.0.1517662481.a542a12b9195bb49
	.mason/mason link build2 0.7.0-a.0.1517662481.a542a12b9195bb49
	.mason/mason install catch 1.9.6
	.mason/mason link catch 1.9.6
	.mason/mason install benchmark 1.2.0
	.mason/mason link benchmark 1.2.0

release: mason_packages
	mason_packages/.link/bin/b -v config.cxx=$(CXX) config.cxx.coptions="-O3 -DNDEBUG -D_GLIBCXX_USE_CXX11_ABI=0"

debug: mason_packages
	mason_packages/.link/bin/b -v config.cxx=$(CXX) config.cxx.coptions="-O0 -g -DDEBUG -D_GLIBCXX_USE_CXX11_ABI=0"

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
	mason_packages/.link/bin/bpkg create -d /tmp/hpp-skel-build -v
	mason_packages/.link/bin/bpkg build -d /tmp/hpp-skel-build ./ -v
	mason_packages/.link/bin/bpkg test -d /tmp/hpp-skel-build hpp-skel -v

tree-clean:
	mason_packages/.link/bin/bpkg clean -d /tmp/hpp-skel-build hpp-skel -v

.PHONY: test bench