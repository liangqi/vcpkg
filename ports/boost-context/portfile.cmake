# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/context
    REF boost-1.71.0
    SHA512 d1da9103e22d45461fe16def14879aed3e6e67b3c83f41100a2f762c3ca14dbd52e381809968ddf4ecf5caf838d4d1f0859d6a94e7e7addbad32a1a56c6eb171
    HEAD_REF master
)

file(READ "${SOURCE_PATH}/build/Jamfile.v2" _contents)
string(REPLACE "import ../../config/checks/config" "import config/checks/config" _contents "${_contents}")
file(WRITE "${SOURCE_PATH}/build/Jamfile.v2" "${_contents}")
file(COPY "${CURRENT_INSTALLED_DIR}/share/boost-config/checks" DESTINATION "${SOURCE_PATH}/build/config")

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})

# boost-context removed all.hpp, which is used by FindBoost to determine that context is installed
if(NOT EXISTS ${CURRENT_PACKAGES_DIR}/include/boost/context/all.hpp)
    file(WRITE ${CURRENT_PACKAGES_DIR}/include/boost/context/all.hpp
        "#error \"#include <boost/context/all.hpp> is no longer supported by boost_context.\"")
endif()
