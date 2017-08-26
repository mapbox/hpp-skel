default: release

release:
	mkdir -p build && cd build && cmake ../ -DCMAKE_BUILD_TYPE=Release && VERBOSE=1 cmake --build .

debug:
	mkdir -p build && cd build && cmake ../ -DCMAKE_BUILD_TYPE=Debug && VERBOSE=1 cmake --build .

test: default 
	./build/unit-tests

tidy:
	./scripts/clang-tidy.sh

coverage:
	./scripts/coverage.sh

clean:
	rm -rf build

format:
	./scripts/format.sh
