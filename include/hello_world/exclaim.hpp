#pragma once

#include <iostream>

namespace hello_world {

/**
 * Add an exclamation point to the end of a string
 * @memberof hello_world
 * @name exclaim
 * @param {std::String} message
 * @returns {std::String} message!
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