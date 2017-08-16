CC := $(CC)
CXX := $(CXX)
CXXFLAGS := $(CXXFLAGS) -Iinclude -std=c++11
RELEASE_FLAGS := -O3 -DNDEBUG
WARNING_FLAGS := -Wall -Wextra -pedantic -Werror -Wsign-compare -Wfloat-equal -Wfloat-conversion -Wshadow -Wno-unsequenced
DEBUG_FLAGS := -g -O0 -DDEBUG -fno-inline-functions -fno-omit-frame-pointer

export BUILDTYPE ?= Debug

ifeq ($(BUILDTYPE),Release)
	FINAL_FLAGS := -g $(WARNING_FLAGS) $(RELEASE_FLAGS)
else
	FINAL_FLAGS := -g $(WARNING_FLAGS) $(DEBUG_FLAGS)
endif

# otool -L build/Debug/test to see the dynamic library (loaded at runtime) deps of a given binary (they are "linked" to the binary or executable)
default: test/* include/* Makefile
	mkdir -p build build/Release build/Debug
	$(CXX) $(FINAL_FLAGS) test/*.cpp $(CXXFLAGS) -lz -o build/$(BUILDTYPE)/test

test: build/$(BUILDTYPE)/test default
	./build/$(BUILDTYPE)/test

clean:
	rm -rf build
