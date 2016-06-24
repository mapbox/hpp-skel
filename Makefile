CXXFLAGS += -I include --std=c++14 -Wall -Wextra -Werror

default: test

test: tests/unit/* include/hello_world/* Makefile
	$(CXX) tests/unit/*.cpp $(CXXFLAGS) -o test
	./test

SOURCES = $(include/hello_world.hpp)
HEADERS = $(wildcard include/hello_world/*.hpp)
COMMON_DOC_FLAGS = --report --output docs $(HEADERS)

cldoc:
	pip install cldoc --user

docs: cldoc
	cldoc generate $(CXXFLAGS) -- $(COMMON_DOC_FLAGS)