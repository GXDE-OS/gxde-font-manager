set(TOOL_SOURCES
    main.cpp
)

add_executable(gfont-install
    ${TOOL_SOURCES}
)

target_link_libraries(gfont-install PRIVATE
    Qt6::Core
    gxde-font-installer
)

target_include_directories(gfont-install PRIVATE
    ${PROJECT_SOURCE_DIR}/libgxde-font-installer
)

install(TARGETS gfont-install
    RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
)