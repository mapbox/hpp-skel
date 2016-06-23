#include <mapbox/hello_world.hpp>

#include <iostream>
#include <cassert>

using namespace mapbox::hello_world;

static void test_exclaim() {
    std::string value = exclaim ("hello");
    assert(value == "hello!");
}

int main() {
    test_exclaim();
    return 0;
}