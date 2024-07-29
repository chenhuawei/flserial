# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.14)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
project(flserial_library VERSION 0.1.1 LANGUAGES C CXX)

add_subdirectory(serial)

include_directories(serial/include serial/include/serial)



if(APPLE)
    add_library(flserial STATIC
            "flserial.cpp"
            "flserial.def"
            serial/include serial/include/serial
            flserial.h
    )
    link_libraries(flserial serial)

    set_target_properties(flserial PROPERTIES
            FRAMEWORK TRUE
            FRAMEWORK_VERSION A
            MACOSX_FRAMEWORK_IDENTIFIER com.cmake.dynamicFramework
#            MACOSX_FRAMEWORK_INFO_PLIST Info.plist
            # "current version" in semantic format in Mach-O binary file
            VERSION 16.4.0
            # "compatibility version" in semantic format in Mach-O binary file
            SOVERSION 1.0.0
            PUBLIC_HEADER flserial.h
#            XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
    )
else ()
    add_library(flserial SHARED
            "flserial.cpp"
            "flserial.def"
    )
    target_link_libraries(flserial serial)
    set_target_properties(flserial PROPERTIES
            PUBLIC_HEADER flserial.h
            OUTPUT_NAME "flserial"
    )
endif()

target_compile_definitions(flserial PUBLIC DART_SHARED_LIB)
