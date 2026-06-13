set(TOOL_SOURCES
    main.cpp
)

add_executable(gfont-uninstall
    ${TOOL_SOURCES}
)

target_link_libraries(gfont-uninstall PRIVATE
    Qt6::Core
    gxde-font-installer
)

target_include_directories(gfont-uninstall PRIVATE
    ${PROJECT_SOURCE_DIR}/libgxde-font-installer
)

install(TARGETS gfont-uninstall
    RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
)