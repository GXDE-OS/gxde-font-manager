QT += core
QT -= gui

CONFIG += c++11

TARGET = gfont-install
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp
DEFINES += QT_DEPRECATED_WARNINGS
INCLUDEPATH += $$PWD/../libgxde-font-installer
LIBS += -L$$OUT_PWD/../libgxde-font-installer -lgxde-font-installer

target.path = /usr/bin

INSTALLS += target
