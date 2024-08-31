/*
 * Copyright (C) 2017 ~ 2018 Deepin Technology Co., Ltd.
 *
 * Author:     rekols <rekols@foxmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "mainwindow.h"
#include <DApplication>
#include <DWidgetUtil>
#include <QCommandLineParser>
#include <QDebug>
#include <DLog>
#include "utils.h"

DWIDGET_USE_NAMESPACE
DCORE_USE_NAMESPACE

int main(int argc, char *argv[])
{
    // load dtk xcb plugin.
    DApplication::loadDXcbPlugin();

    // init Dtk application's attrubites.
    DApplication app(argc, argv);
    app.setTheme("light");
    app.setAttribute(Qt::AA_UseHighDpiPixmaps);
    app.loadTranslator();
    app.setOrganizationName("GXDE");
    app.setApplicationVersion(DApplication::buildVersion("1.0"));
    app.setApplicationAcknowledgementPage("https://gitee.com/GXDE-OS/gxde-font-manager");
    app.setProductIcon(QIcon(":/images/gxde-font-installer.svg"));
    app.setProductName(DApplication::translate("Main", "GXDE Font Installer"));
    app.setStyleSheet(Utils::getQssContent(":/qss/style.qss"));
    app.setApplicationDescription(DApplication::translate("Main","GXDE Font Installer is used to install and uninstall font file for users with bulk install function."));

    DLogManager::registerConsoleAppender();
    DLogManager::registerFileAppender();

    // add command line parser to app.
    QCommandLineParser parser;
    parser.setApplicationDescription("GXDE Font Installer.");
    parser.addHelpOption();
    parser.addVersionOption();
    parser.addPositionalArgument("filename", "Font file path.", "file [file..]");
    parser.process(app);

    // init modules.
    MainWindow w;
    w.setFixedSize(520, 440);
    w.setWindowIcon(QIcon(":/images/gxde-font-installer.svg"));
    w.show();

    if (app.setSingleInstance("gxde-font-installer")) {
        Dtk::Widget::moveToCenter(&w);
    }

    const QStringList fileList = parser.positionalArguments();

    // handle command line parser.
    if (!fileList.isEmpty()) {
        QMetaObject::invokeMethod(&w, "onSelected", Qt::QueuedConnection, Q_ARG(QStringList, fileList));
    }

    return app.exec();
}
