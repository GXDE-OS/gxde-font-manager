#-------------------------------------------------
#
# Project created by QtCreator 2017-04-17T11:02:31
#
#-------------------------------------------------

QT       += core gui widgets

TARGET = gxde-font-preview-plugin
TEMPLATE = lib
CONFIG += plugin link_pkgconfig
PKGCONFIG += freetype2 fontconfig dde-file-manager dtkwidget

LIBS += -L$$OUT_PWD/../libgxde-font-installer -lgxde-font-installer
INCLUDEPATH += $$PWD/../libgxde-font-installer

isEqual(ARCH, sw_64){
    DEFINES += SW_CPUINFO
    QMAKE_CXXFLAGS += -mieee
}

isEmpty(LIB_INSTALL_DIR) {
    PLUGINDIR = $$[QT_INSTALL_LIBS]/dde-file-manager/plugins
} else {
    PLUGINDIR = $$LIB_INSTALL_DIR/dde-file-manager/plugins
}

SOURCES += \
    main.cpp \
    fontpreview.cpp

HEADERS += \
    fontpreview.h
DISTFILES += \
    gxde-font-preview-plugin.json

PLUGIN_INSTALL_DIR = $$PLUGINDIR/previews

unix {
    target.path = $$PLUGIN_INSTALL_DIR
    INSTALLS += target
}
