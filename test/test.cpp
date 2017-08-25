#include <hello_world.hpp>
#define CATCH_CONFIG_MAIN
#include <catch.hpp>

using namespace hello_world;

TEST_CASE("test version") {
    REQUIRE(HELLOWORLD_VERSION_STRING == "1.0.0");
}

TEST_CASE("test_exclaim") {
    std::string value = exclaim("hello");
    REQUIRE(value == "hello!");
}