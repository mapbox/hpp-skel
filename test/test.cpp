#include <hello_world.hpp>
#define CATCH_CONFIG_MAIN
#include <catch.hpp>

TEST_CASE("test version")
{
    REQUIRE(HELLOWORLD_VERSION_STRING == std::string("1.0.0"));
}

TEST_CASE("test_exclaim")
{
    std::string value = hello_world::exclaim("hello");
    REQUIRE(value == std::string("hello!"));
}

TEST_CASE("test_expensive")
{
    std::size_t work = 10000000;
    std::string result = hello_world::expensive(work);
    REQUIRE(result == std::string("Expensive work is finished"));
}