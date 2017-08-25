cmake_minimum_required(VERSION 3.8)
project(hpp_skel LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED on)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/mason.cmake)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -Wsign-compare -Wconversion -Wshadow")

mason_use(catch VERSION 1.9.6 HEADER_ONLY)
include_directories(SYSTEM ${MASON_PACKAGE_catch_INCLUDE_DIRS})

include_directories("${PROJECT_SOURCE_DIR}/include")

file(GLOB TEST_SOURCES test/*.cpp)
add_executable(unit-tests ${TEST_SOURCES})
