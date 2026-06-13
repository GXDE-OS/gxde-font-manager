set(APP_SOURCES
    homepage.cpp
    listview.cpp
    listitem.cpp
    main.cpp
    mainwindow.cpp
    multifilepage.cpp
    singlefilepage.cpp
    utils.cpp
    progress.cpp
    refreshthread.cpp
)

set(APP_HEADERS
    homepage.h
    listview.h
    listitem.h
    mainwindow.h
    multifilepage.h
    singlefilepage.h
    utils.h
    progress.h
    refreshthread.h
)

set(APP_RESOURCES
    gxde-font-installer.qrc
)

add_executable(gxde-font-installer-app
    ${APP_SOURCES}
    ${APP_HEADERS}
    ${APP_RESOURCES}
)

set_target_properties(gxde-font-installer-app PROPERTIES
    OUTPUT_NAME gxde-font-installer
)

target_link_libraries(gxde-font-installer-app PRIVATE
    Qt6::Core
    Qt6::Widgets
    Qt6::Gui
    Qt6::Svg
    Dtk6::Core
    Dtk6::Log
    ${Dtk2widget_LIBRARIES}
    ${FONTCONFIG_LIBRARIES}
    ${FREETYPE2_LIBRARIES}
    gxde-font-installer
)

target_include_directories(gxde-font-installer-app PRIVATE
    ${PROJECT_SOURCE_DIR}/libgxde-font-installer
)

install(TARGETS gxde-font-installer-app
    RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
)

install(FILES gxde-font-installer.desktop
    DESTINATION ${CMAKE_INSTALL_PREFIX}/share/applications
)

install(FILES
    com.gxde.pkexec.font-install.policy
    com.gxde.pkexec.font-uninstall.policy
    DESTINATION ${CMAKE_INSTALL_PREFIX}/share/polkit-1/actions
)

install(FILES images/gxde-font-installer.svg
    DESTINATION ${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/scalable/apps
)

install(DIRECTORY translations/
    DESTINATION ${CMAKE_INSTALL_PREFIX}/share/gxde-font-installer/translations
    FILES_MATCHING PATTERN "*.qm"
)