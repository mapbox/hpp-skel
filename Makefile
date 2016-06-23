CXXFLAGS += -I include --std=c++14 -Wall -Wextra -Werror

default: test

test: tests/unit/* include/mapbox/hello_world/* Makefile
	$(CXX) tests/unit/*.cpp $(CXXFLAGS) -o test
	./test