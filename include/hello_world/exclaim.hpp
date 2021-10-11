#ifndef HELLO_WORLD_EXCLAIM_HPP
#define HELLO_WORLD_EXCLAIM_HPP

#include <string>

namespace hello_world {

/* Exclaim a string. Part of the <hello_world> namespace.
 * @message the message you would like to exclaim.
 *
 * exclaim adds an exclamation point to the beginning and end of a string.
 *
 * @return your message with an exclamation point on each end.
 */
inline auto exclaim(const std::string& message) -> std::string
{
    std::string response = message + "!";
    return response;
}

} // namespace hello_world

#endif
