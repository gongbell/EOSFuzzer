add_executable(gravatarcafe.wasm ${CMAKE_CURRENT_SOURCE_DIR}/src/gravatarcafe.cpp)
target_include_directories(gravatarcafe.wasm
   PUBLIC 
   ${CMAKE_CURRENT_SOURCE_DIR}/include)

set_target_properties(gravatarcafe.wasm
   PROPERTIES
   RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/abi/gravatarcafe.abi" "${CMAKE_CURRENT_BINARY_DIR}" COPYONLY)
#install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION ${WASM_ROOT}/eosio.wasmsdk/include)
