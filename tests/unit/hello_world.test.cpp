#include <hello_world/hello_world.hpp>

#include <iostream>
#include <cassert>

using namespace hello_world;

static void test_exclaim() {
    std::string value = exclaim ("hello");
    assert(value == "!hello!");
}

int main() {
    test_exclaim();
    return 0;
}