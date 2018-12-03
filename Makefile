
# use custom shell to set up env
SHELL := ./scripts/shell

# Whether to turn compiler warnings into errors
export WERROR ?= true
export BUILD_DIR ?= cmake-build
CC := $(CC)
CXX := $(CXX)

default: release

local.env:
	./scripts/setup.sh --config local.env

mason_packages: local.env
	.mason/mason install build2 0.8.0
	.mason/mason link build2 0.8.0
	.mason/mason install catch 1.9.6
	.mason/mason link catch 1.9.6
	.mason/mason install benchmark 1.2.0
	.mason/mason link benchmark 1.2.0

release: mason_packages
	mason_packages/.link/bin/b -v config.cxx=$(CXX) config.bin.ar=llvm-ar config.cxx.loptions="${LDFLAGS}" config.cxx.coptions="-O3 -DNDEBUG -D_GLIBCXX_USE_CXX11_ABI=0 ${CXXFLAGS}"

debug: mason_packages
	mason_packages/.link/bin/b -v config.cxx=$(CXX) config.bin.ar=llvm-ar config.cxx.loptions="${LDFLAGS}" config.cxx.coptions="-O0 -g -DDEBUG -D_GLIBCXX_USE_CXX11_ABI=0  ${CXXFLAGS}"

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

distclean: clean
	rm -rf mason_packages
	# remove remains from running './scripts/setup.sh'
	rm -rf .mason
	rm -rf .toolchain
	rm -f local.env

format:
	./scripts/format.sh

.PHONY: test bench
