cmake_minimum_required(VERSION 3.16)
project(lib C)
set(CMAKE_C_STANDARD 99)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/")
find_package(Lit REQUIRED)

include_directories(include/ ${LIT_INCLUDE_DIRS})
add_subdirectory(util/embed-file/)

add_custom_command(
	OUTPUT src/lit_lib.c
	COMMAND embedfile src/ lit_lib include/lib.lit
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	DEPENDS include/lib.lit)

add_library(lib SHARED src/lib.c include/lib.h src/lit_lib.c)
target_link_libraries(lib ${LIT_LIBRARIES} m dl)

set_target_properties(lib PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/dist")
install(TARGETS lib DESTINATION lib)

add_executable(test src/test.c)
set_target_properties(test PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(test LINK_PUBLIC lib)