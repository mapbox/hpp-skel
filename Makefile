
# Whether to turn compiler warnings into errors
export WERROR ?= true

default: release

release:
	mkdir -p build && cd build && cmake ../ -DCMAKE_BUILD_TYPE=Release -DWERROR=$(WERROR) && VERBOSE=1 cmake --build .

debug:
	mkdir -p build && cd build && cmake ../ -DCMAKE_BUILD_TYPE=Debug -DWERROR=$(WERROR) && VERBOSE=1 cmake --build .

test: default 
	./build/unit-tests

coverage:
	./scripts/coverage.sh

clean:
	rm -rf build
