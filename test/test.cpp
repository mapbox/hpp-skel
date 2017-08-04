#include <hello_world.hpp>

#include <iostream>
#include <cassert>

using namespace hello_world;

static void test_version() {
    std::clog << "test_version ... ";
    assert(HELLOWORLD_VERSION_STRING == "0.1.0");
    std::clog << "success!\n";
}

static void test_exclaim() {
    std::clog << "test_exclaim ... ";
    std::string value = exclaim("hello");
    assert(value == "hello!");
    std::clog << "success!\n";
}

int main() {
    test_version();
    test_exclaim();
    return 0;
}
