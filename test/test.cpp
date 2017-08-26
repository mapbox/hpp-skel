#include <hello_world.hpp>
#define CATCH_CONFIG_MAIN
#include <catch.hpp>

TEST_CASE("test version") {
    REQUIRE(HELLOWORLD_VERSION_STRING == "1.0.0");
}

TEST_CASE("test_exclaim") {
    std::string value = hello_world::exclaim("hello");
    REQUIRE(value == "hello!");
}