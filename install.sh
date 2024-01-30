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

git checkout docking
mkdir -p build
echo "${CIMGUI} build folder created"

LIB_IMGUI="-I./ -I./backends -I./docs -I./examples -I./mics"

g++  -o ./build/imgui_demo.o -c imgui_demo.cpp ${LIB_IMGUI}
g++  -o ./build/imgui_draw.o -c imgui_draw.cpp ${LIB_IMGUI}
g++  -o ./build/imgui_tables.o -c imgui_tables.cpp ${LIB_IMGUI}
g++  -o ./build/imgui_widgets.o -c imgui_widgets.cpp ${LIB_IMGUI}
g++  -o ./build/imgui.o -c imgui.cpp ${LIB_IMGUI}

g++  -o ./build/imgui_impl_opengl3.o -c ./backends/imgui_impl_opengl3.cpp ${LIB_IMGUI}
g++  -o ./build/imgui_impl_glfw.o -c ./backends/imgui_impl_glfw.cpp ${LIB_IMGUI}

## install headers
sudo find ./ -type f -name "*.h*" -exec cp {} "/usr/local/include/" \;

echo "${CIMGUI} compilation is done!"
