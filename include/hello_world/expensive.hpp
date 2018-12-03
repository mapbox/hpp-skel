#include <map>
#include <string>

namespace hello_world {

// Expensive allocation of std::map, querying, and string comparison,
// therefore threads are busy. This example is primarily used for benchmarking.
inline std::string expensive(std::size_t work_to_do)
{

    std::map<std::size_t, std::string> container;

    for (std::size_t i = 0; i < work_to_do; ++i)
    {
        container.emplace(i, std::to_string(i));
    }

    for (std::size_t i = 0; i < work_to_do; ++i)
    {
        std::string const& item = container[i];
        if (item != std::to_string(i))
        {
            // Marked NOLINT to avoid clang-tidy cert-err60-cpp error which we cannot
            // avoid on some linux distros where std::runtime_error is not properly
            // marked noexcept. Details at https://www.securecoding.cert.org/confluence/display/cplusplus/ERR60-CPP.+Exception+objects+must+be+nothrow+copy+constructible
            throw std::runtime_error("Uh oh, this should never happen"); // NOLINT
        }
    }

    std::string result = "Expensive work is finished";

    return result;
}
} // namespace hello_world