cmake_minimum_required(VERSION 3.5)

project (mq-demo)

set (PROJECT_STATIC_LIB_NAME mq-demo-lib-static)
set (PROJECT_STATIC_BIN_NAME mq-demo-bin-static)

set (PROJECT_DYNAMIC_LIB_NAME mq-demo-lib-dynmic)
set (PROJECT_DYNAMIC_BIN_NAME mq-demo-bin-dynmic)

set (PROJECT_SOURCE_DIR ../)


############################################################
# Create a  static library
############################################################

#Generate the static library from the library sources
add_library(${PROJECT_STATIC_LIB_NAME} STATIC 
    ${PROJECT_SOURCE_DIR}/src/Hello.cpp
)

target_include_directories(${PROJECT_STATIC_LIB_NAME}
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)

############################################################
# Create a dynmaic library
############################################################

#Generate the static library from the library sources
add_library(${PROJECT_DYNAMIC_LIB_NAME} SHARED
    ${PROJECT_SOURCE_DIR}/src/Hello.cpp
)

target_include_directories(${PROJECT_DYNAMIC_LIB_NAME}
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)

############################################################
# Create an static lib executable
############################################################

# Add an executable with the above sources
add_executable(${PROJECT_STATIC_BIN_NAME}
    ${PROJECT_SOURCE_DIR}/src/main.cpp
)

# link the  lib target with the binary target
target_link_libraries( ${PROJECT_STATIC_BIN_NAME}
    PRIVATE 
        ${PROJECT_STATIC_LIB_NAME}
)

############################################################
# Create an dynamic lib executable
############################################################
# 查找动态链接库时先从可执行文件当前目录找起
set(CMAKE_INSTALL_RPATH "\$ORIGIN")

# Add an executable with the above sources
add_executable(${PROJECT_DYNAMIC_BIN_NAME}
    ${PROJECT_SOURCE_DIR}/src/main.cpp
)

# link the  lib target with the binary target
target_link_libraries( ${PROJECT_DYNAMIC_BIN_NAME}
    PRIVATE 
        ${PROJECT_DYNAMIC_LIB_NAME}
)


############################################################
# Install
############################################################

install (TARGETS ${PROJECT_STATIC_BIN_NAME}
    DESTINATION bin/static)

install (TARGETS ${PROJECT_DYNAMIC_BIN_NAME}
    DESTINATION bin/dyn)

install (TARGETS ${PROJECT_DYNAMIC_LIB_NAME}
    DESTINATION bin/dyn)

# Library
# Note: may not work on windows
install (TARGETS ${PROJECT_STATIC_LIB_NAME}
    LIBRARY DESTINATION lib)

install (TARGETS ${PROJECT_DYNAMIC_LIB_NAME}
    LIBRARY DESTINATION lib)

# Header files
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ 
    DESTINATION include)

# Config
install (FILES cmake-examples.conf
    DESTINATION etc)