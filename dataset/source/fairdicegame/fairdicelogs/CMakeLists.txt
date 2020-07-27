add_executable(fairdicelogs.wasm ${CMAKE_CURRENT_SOURCE_DIR}/src/fairdicelogs.cpp)
target_include_directories(fairdicelogs.wasm
   PUBLIC 
   ${CMAKE_CURRENT_SOURCE_DIR}/include)

set_target_properties(fairdicelogs.wasm
   PROPERTIES
   RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")

add_custom_target(fairdicelogs.abi ALL)

set(ABI_FILE "${CMAKE_CURRENT_BINARY_DIR}/fairdicelogs.abi")

add_custom_command(
    TARGET fairdicelogs.abi
    COMMAND eosiocpp -g  ${ABI_FILE}   "${CMAKE_CURRENT_SOURCE_DIR}/include/fairdicelogs.hpp"
)

add_custom_command(TARGET fairdicelogs.abi POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy ${ABI_FILE} "${CMAKE_CURRENT_SOURCE_DIR}/abi/fairdicelogs.abi"
)
