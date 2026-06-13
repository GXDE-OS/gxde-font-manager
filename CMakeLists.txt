cmake_minimum_required(VERSION 3.16)

project(gxde-font-installer
    VERSION 1.0.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS
    Core
    Widgets
    Gui
    Svg
)

find_package(Dtk6 REQUIRED COMPONENTS Core Log)
find_package(Dtk2widget REQUIRED)
find_package(PkgConfig REQUIRED)

pkg_check_modules(FONTCONFIG REQUIRED fontconfig)
pkg_check_modules(FREETYPE2 REQUIRED freetype2)

include_directories(
    ${PROJECT_SOURCE_DIR}/libgxde-font-installer
    ${FONTCONFIG_INCLUDE_DIRS}
    ${FREETYPE2_INCLUDE_DIRS}
    ${DtkCore_INCLUDE_DIRS}
    ${Dtk6Log_INCLUDE_DIRS}
)

link_directories(
    ${FONTCONFIG_LIBRARY_DIRS}
    ${FREETYPE2_LIBRARY_DIRS}
)

add_subdirectory(libgxde-font-installer)
add_subdirectory(gxde-font-installer)
add_subdirectory(gfont-install)
add_subdirectory(gfont-uninstall)
#add_subdirectory(gxde-font-preview-plugin)