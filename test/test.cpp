#include <gzip.hpp>

#include <iostream>
#include <cassert>

// static void test_version() {
//     std::clog << "test_version ... ";
//     assert(HELLOWORLD_VERSION_STRING == "1.0.0");
//     std::clog << "success!\n";
// }

// TODO: port catch instead of using assert (https://github.com/philsquared/Catch)
static void test_compress() {
    std::clog << "test_compress... ";
    std::string data = "hello";
    std::string value = gzip::compress(data);
    assert(value.size() > 0);
    assert(value.size() > data.size());
    std::clog << "success!\n";
}

int main() {
    // test_version();
    test_compress();
    return 0;
}
