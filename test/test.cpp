#include <gzip.hpp>

#include <iostream>
#include <cassert>
#include "catch.hpp"

// static void test_version() {
//     std::clog << "test_version ... ";
//     assert(HELLOWORLD_VERSION_STRING == "1.0.0");
//     std::clog << "success!\n";
// }

TEST_CASE("successful compress") {
    std::string data = "hello";
    std::string value = gzip::compress(data);

    REQUIRE(value.size() > data.size());
}

TEST_CASE("successful decompress") {
    std::string data = "hello";
    std::string compressed_data = gzip::compress(data);
    std::string value = gzip::decompress(compressed_data);

    REQUIRE(value.size() == data.size());
}

TEST_CASE("invalid decompression")
{
    std::string data("this is a string that should be compressed data");
    // data is not compressed but we will try to decompress it

    CHECK_THROWS(gzip::decompress(data));
}

TEST_CASE("round trip compression")
{
    std::string data("this is a sentence that will be compressed into something");
    // CHECK(!gzip::is_compressed(data));
    
    int strategy;

    SECTION("strategy - invalid compression")
    {
        strategy = 99;
        int level = Z_DEFAULT_COMPRESSION;

        CHECK_THROWS(gzip::compress(data, level, strategy));
    }
    
    SECTION("compression level - invalid")
    {
        strategy = Z_DEFAULT_STRATEGY;
        int level = 99;

        CHECK_THROWS(gzip::compress(data, level, strategy));
    }
}