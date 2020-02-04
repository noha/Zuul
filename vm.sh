#!/bin/bash

LABEL=`uname -a | grep Darwin`
INSTALL_DIR=`dirname $0`

if [ "$LABEL" == "" ] ; 
then 
    $INSTALL_DIR/linux-vm/pharo $*
else
    $INSTALL_DIR/macos-vm/Pharo.app/Contents/MacOS/Pharo $*
fi
