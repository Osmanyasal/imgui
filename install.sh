#!/bin/bash

CIMGUI="Custom IMGUI"

if [ $# -gt 0 ]; then
    if [ "$1" = "--help" ]; then
        echo "$0 [clean]"
        exit 0
    fi
    if [ "$1" = "clean" ]; then
        echo "${CIMGUI} executing make clean"
        rm -rf ./build
        exit 0
    else
        echo "Unknown parameter: $1"
        exit 1
    fi
fi

mkdir -p build
echo "${CIMGUI} build folder created"

LIB_IMGUI="-I./lib/imgui/ -I./lib/imgui/backends -I./lib/imgui/docs -I./lib/imgui/examples -I./lib/imgui/mics"

g++ ${LIB_IMGUI} -o ./build/imgui_demo.o -c imgui_demo.cpp
g++ ${LIB_IMGUI} -o ./build/imgui_draw.o -c imgui_draw.cpp
g++ ${LIB_IMGUI} -o ./build/imgui_tables.o -c imgui_tables.cpp
g++ ${LIB_IMGUI} -o ./build/imgui_widgets.o -c imgui_widgets.cpp
g++ ${LIB_IMGUI} -o ./build/imgui.o -c imgui.cpp

echo "${CIMGUI} compilation is done!"