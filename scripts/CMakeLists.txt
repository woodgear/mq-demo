cmake_minimum_required(VERSION 3.5)

project (mq-demo)

set (PROJECT_SOURCE_DIR ../)

set(SOURCES
    ${PROJECT_SOURCE_DIR}/src/Hello.cpp
    ${PROJECT_SOURCE_DIR}/src/main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} 
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)

add_library(hello_library STATIC
    src/Hello.cpp
)