set(LIB_SOURCES
    dfontpreview.cpp
    dfontinfomanager.cpp
    dfontmanager.cpp
    dfontloadthread.cpp
    dfontwidget.cpp
)

set(LIB_HEADERS
    dfontpreview.h
    dfontinfomanager.h
    dfontmanager.h
    dfontloadthread.h
    dfontwidget.h
)

add_library(gxde-font-installer SHARED
    ${LIB_SOURCES}
    ${LIB_HEADERS}
)

target_link_libraries(gxde-font-installer PRIVATE
    Qt6::Core
    Qt6::Widgets
    Qt6::Gui
    Dtk6::Core
    ${Dtk2widget_LIBRARIES}
    ${FONTCONFIG_LIBRARIES}
    ${FREETYPE2_LIBRARIES}
)

target_include_directories(gxde-font-installer PUBLIC
    ${PROJECT_SOURCE_DIR}/libgxde-font-installer
)

set_target_properties(gxde-font-installer PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
)

include(GNUInstallDirs)

install(TARGETS gxde-font-installer
    LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}
)

install(FILES ${LIB_HEADERS}
    DESTINATION ${CMAKE_INSTALL_PREFIX}/include/gxde-font-installer
)

install(FILES CONTENTS.txt
    DESTINATION ${CMAKE_INSTALL_PREFIX}/share/gxde-font-installer
)

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/gxde-font-installer.pc.in
    ${CMAKE_CURRENT_BINARY_DIR}/gxde-font-installer.pc
    @ONLY
)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/gxde-font-installer.pc
    DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/pkgconfig
)