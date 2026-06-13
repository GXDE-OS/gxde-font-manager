pkg_check_modules(GXDE_FILE_MANAGER QUIET gxde-file-manager)

if(GXDE_FILE_MANAGER_FOUND)
    set(PLUGIN_SOURCES
        main.cpp
        fontpreview.cpp
    )

    set(PLUGIN_HEADERS
        fontpreview.h
    )

    add_library(gxde-font-preview-plugin MODULE
        ${PLUGIN_SOURCES}
        ${PLUGIN_HEADERS}
    )

    target_link_libraries(gxde-font-preview-plugin PRIVATE
        Qt6::Core
        Qt6::Widgets
        Qt6::Gui
        ${Dtk2widget_LIBRARIES}
        ${FONTCONFIG_LIBRARIES}
        ${FREETYPE2_LIBRARIES}
        ${GXDE_FILE_MANAGER_LIBRARIES}
        gxde-font-installer
    )

    target_include_directories(gxde-font-preview-plugin PRIVATE
        ${PROJECT_SOURCE_DIR}/libgxde-font-installer
        ${GXDE_FILE_MANAGER_INCLUDE_DIRS}
    )

    set_target_properties(gxde-font-preview-plugin PROPERTIES
        OUTPUT_NAME gxde-font-preview-plugin
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/plugins
    )

    install(TARGETS gxde-font-preview-plugin
        LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/gxde-file-manager/plugins/previews
    )

    install(FILES gxde-font-preview-plugin.json
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/gxde-file-manager/plugins/previews
    )
else()
    message(WARNING "gxde-file-manager not found, skipping gxde-font-preview-plugin")
endif()