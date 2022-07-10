#!/bin/sh
# $Id: 32dev.sh,v 1.4 2014/10/02 09:31:37 eha Exp eha $
# Copyright (C) 2007  Frederick Emmott <mail@fredemmott.co.uk>
# Copyright 2009  Eric Hameleers, Eindhoven, NL
# Based on the file with the same name which is part of
# the Slamd64 Linux project (www.slamd64.com)

# Distributed under the GNU General Public License, version 2, as
# published by the Free Software Foundation.

# Modify the compilation/linking environment:
export PATH="/usr/bin/32:/usr/lib/qt/bin:$PATH"
export CC="gcc" # This is actually the /usr/bin/32/gcc wrapper
export CXX="g++"
export FC="gfortran" # This is actually the /usr/bin/32/gfortran wrapper
export F77="gfortran"

# Change the shell prompt to make it clear that we are in 32bit mode:
export PS1='\u@\h (32bit):\w\$ '

# Check for Qt5, Qt4 and the old 'compatibility install' of Qt3:
if [ -d /opt/kde3/lib/qt3 ]; then
  export QTDIR=/opt/kde3/lib/qt3
fi
if [ -d /usr/lib/qt ]; then
  export QT4DIR=/usr/lib/qt
fi
if [ -d /usr/lib/qt5 ]; then
  export QT5DIR=/usr/lib/qt5
fi

if [ ! "$LD_LIBRARY_PATH" = "" ]; then
  export LD_LIBRARY_PATH="/usr/local/lib:/lib:/usr/lib:$LD_LIBRARY_PATH"
else
  export LD_LIBRARY_PATH="/usr/local/lib:/lib:/usr/lib"
fi

if [ ! "$PKG_CONFIG_PATH" = "" ]; then
  export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
else
  export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/lib/pkgconfig"
fi
