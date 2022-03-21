cmake_minimum_required(VERSION 3.21.3)

# specify project name (version optional)
project(project_name VERSION 1.0)

add_executable(${CMAKE_PROJECT_NAME} main.cpp)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# additional paths to search for header files
#target_include_directories(Tutorial PUBLIC
#                           "path-here"
#                           )

