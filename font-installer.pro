######################################################################
# Automatically generated by qmake (3.0) ?? 11? 30 09:55:49 2017
######################################################################

TEMPLATE = subdirs

SUBDIRS += \
           gxde-font-installer\
           libgxde-font-installer \
           gxde-font-preview-plugin \
           gfont-install \
	       gfont-uninstall

#           dfont-install \
# 	        dfont-uninstall \

gxde-font-installer.depends = libgxde-font-installer
gxde-font-preview-plugin.depends = libgxde-font-installer
gfont-install.depends = libgxde-font-installer
