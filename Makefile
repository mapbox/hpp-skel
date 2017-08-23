default: CMakeLists.txt
	mkdir -p build && cd build && cmake ../ && VERBOSE=1 cmake --build .

test: default 
	./build/unit-tests

clean:
	rm -rf build
