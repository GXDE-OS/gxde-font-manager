######################################################################
# Automatically generated by qmake (3.0) ?? 12? 20 11:42:33 2017
######################################################################

QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = gxde-font-installer
TEMPLATE = lib
CONFIG += c++11 link_pkgconfig
PKGCONFIG += freetype2 fontconfig dtkwidget

CONFIG += create_pc create_prl no_install_prl

DEFINES += QT_MESSAGELOGCONTEXT

# Input
HEADERS += \
	   dfontpreview.h \
	   dfontinfomanager.h \
	   dfontmanager.h \
           dfontloadthread.h \
           dfontwidget.h

SOURCES += \
	   dfontpreview.cpp \
	   dfontinfomanager.cpp \
	   dfontmanager.cpp \
           dfontloadthread.cpp \
           dfontwidget.cpp

QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_VERSION = $$VERSION
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_NAME = gxde-font-installer
QMAKE_PKGCONFIG_DESCRIPTION = gxde Font Installer Header Files
QMAKE_PKGCONFIG_INCDIR = $$includes.path

includes.path = $$INCLUDE_INSTALL_DIR/gxde-font-installer
includes.files += $$PWD/*.h

isEmpty(PREFIX) {
    PREFIX = /usr
}

isEmpty(LIB_INSTALL_DIR) {
    target.path = $$[QT_INSTALL_LIBS]
} else {
    target.path = $$LIB_INSTALL_DIR
}

isEmpty(INCLUDE_INSTALL_DIR) {
    includes.path = $$PREFIX/include/gxde-font-installer
} else {
    includes.path = $$INCLUDE_INSTALL_DIR/gxde-font-installer
}

contents_file.path = /usr/share/gxde-font-installer/
contents_file.files += $$PWD/CONTENTS.txt

INSTALLS += target includes contents_file
