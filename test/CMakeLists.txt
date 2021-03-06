#
#   Copyright 2014 - 2015 Kulykov Oleh
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

include(CheckLibraryExists)

include_directories(${PROJECT_BINARY_DIR})

link_directories(${PROJECT_BINARY_DIR})

remove_definitions(-DCMAKE_BUILD)

check_include_file("curl/curl.h" HAVE_CURL_CURL_H)
find_package(CURL)

add_executable(test_fayecpp_header test_fayecpp_header.cpp)
set_property(TARGET test_fayecpp_header APPEND PROPERTY COMPILE_FLAGS -DFAYECPP_STATIC)
target_link_libraries(test_fayecpp_header fayecpp_static websockets jansson)
add_test(test_fayecpp_header test_fayecpp_header)


add_executable(test_fayecpp_init test_fayecpp_init.cpp)
set_property(TARGET test_fayecpp_init APPEND PROPERTY COMPILE_FLAGS -DFAYECPP_STATIC)
target_link_libraries(test_fayecpp_init fayecpp_static websockets jansson)
add_test(test_fayecpp_init test_fayecpp_init)


add_executable(test_fayecpp_connect test_fayecpp_connect.cpp)
set_property(TARGET test_fayecpp_connect APPEND PROPERTY COMPILE_FLAGS -DFAYECPP_STATIC)
target_link_libraries(test_fayecpp_connect fayecpp_static websockets jansson)
add_test(test_fayecpp_connect test_fayecpp_connect)


if(HAVE_PTHREAD_H)
	target_link_libraries(test_fayecpp_header pthread)
	target_link_libraries(test_fayecpp_init pthread)
	target_link_libraries(test_fayecpp_connect pthread)
endif(HAVE_PTHREAD_H)

if(HAVE_COREFOUNDATION_FRAMEWORK)
	target_link_libraries(test_fayecpp_header ${COREFOUNDATION_FRAMEWORK})
	target_link_libraries(test_fayecpp_init ${COREFOUNDATION_FRAMEWORK})
	target_link_libraries(test_fayecpp_connect ${COREFOUNDATION_FRAMEWORK})
endif(HAVE_COREFOUNDATION_FRAMEWORK)

if(MINGW)
	target_link_libraries(test_fayecpp_header ws2_32)
	target_link_libraries(test_fayecpp_init ws2_32)
	target_link_libraries(test_fayecpp_connect ws2_32)
endif(MINGW)


if(HAVE_CURL_CURL_H)
	add_executable(dbuploader dbuploader.c)
	target_link_libraries(dbuploader ${CURL_LIBRARIES})
endif(HAVE_CURL_CURL_H)


install(TARGETS test_fayecpp_header DESTINATION bin)
install(TARGETS test_fayecpp_init DESTINATION bin)
install(TARGETS test_fayecpp_connect DESTINATION bin)

if(HAVE_CURL_CURL_H)
	install(TARGETS dbuploader DESTINATION bin)
endif(HAVE_CURL_CURL_H)
