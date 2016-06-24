#include <iostream>

namespace hello_world {

/* Exclaim a string. Part of the <hello_world> namespace.
 * @message the message you would like to exclaim.
 *
 * exclaim adds an exclamation point to the end of a string.
 *
 * @return your message with an exclamation point on the end.
 */
std::string exclaim (std::string message)
{
    std::string response = message + "!";
    return response;
}

} // end hello_world namespace