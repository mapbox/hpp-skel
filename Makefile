default: CMakeLists.txt
	mkdir -p build && cd build && cmake ../ && VERBOSE=1 cmake --build .

test: build/$(BUILDTYPE)/test
	./build/$(BUILDTYPE)/test

clean:
	rm -rf build
