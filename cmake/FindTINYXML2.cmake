# TINYXML2_FOUND
# TINYXML2_INCLUDE_DIRS
# TINYXML2_LIBRARIES

# try to find the CMake config file for TINYXML2 first
find_package(TINYXML2 CONFIG QUIET)
if(TINYXML2_FOUND)
  message(STATUS "Found TINYXML2 via Config file: ${TINYXML2_DIR}")
  if(NOT TINYXML2_LIBRARY AND TARGET tinyxml2)
    # in this case, we're probably using TINYXML2 version 5.0.0 or greater
    # in which case tinyxml2 is an exported target and we should use that    
    set(TINYXML2_LIBRARY tinyxml2)
  endif()
else()
  find_path(TINYXML2_INCLUDE_DIR NAMES tinyxml2.h)

  find_library(TINYXML2_LIBRARY tinyxml2)

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(tinyxml2 DEFAULT_MSG TINYXML2_LIBRARY TINYXML2_INCLUDE_DIR)

  mark_as_advanced(TINYXML2_INCLUDE_DIR TINYXML2_LIBRARY)
endif()

if(NOT TINYXML2_INCLUDE_DIRS)
  set(TINYXML2_INCLUDE_DIRS ${TINYXML2_INCLUDE_DIR})
endif()
if(NOT TINYXML2_LIBRARIES)
  set(TINYXML2_LIBRARIES ${TINYXML2_LIBRARY})
endif()