CC := $(CC)
CXX := $(CXX)
CXXFLAGS := $(CXXFLAGS) -Iinclude -std=c++11
RELEASE_FLAGS := -O3 -DNDEBUG
WARNING_FLAGS := -Wall -Wextra -pedantic -Werror -Wsign-compare -Wfloat-equal -Wfloat-conversion -Wshadow -Wno-unsequenced
DEBUG_FLAGS := -g -O0 -DDEBUG -fno-inline-functions -fno-omit-frame-pointer

export BUILDTYPE ?= Release

ifeq ($(BUILDTYPE),Release)
	FINAL_FLAGS := -g $(WARNING_FLAGS) $(RELEASE_FLAGS)
else
	FINAL_FLAGS := -g $(WARNING_FLAGS) $(DEBUG_FLAGS)
endif

default: test-$(BUILDTYPE)

test-$(BUILDTYPE): test/* include/hello_world.hpp Makefile
	mkdir -p build
	$(CXX) $(FINAL_FLAGS) test/*.cpp $(CXXFLAGS) -o build/test-$(BUILDTYPE)
	./build/test-$(BUILDTYPE)

test: test-$(BUILDTYPE)

clean:
	rm -f test-Release
	rm -f test-Debug
