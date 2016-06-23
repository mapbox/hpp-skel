#pragma once

#include <iostream>

namespace mapbox { namespace hello_world {

/**
 * Add an exclamation point to the end of a string
 * @memberof hello_world
 * @name exclaim
 * @param {std::string} message
 * @returns {std::string} message!
 * @example
 * std::string value = exclaim ("hello");
 * cout << value; // => 'hello!'
 */
std::string exclaim (std::string message)
{
    std::string response = message + "!";
    return response;
}

} // end hello_world namespace
} // end of mapbox namespace