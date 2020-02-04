#!/bin/bash

DIRNAME=`dirname $0`
$DIRNAME/macos/Pharo.app/Contents/MacOS/Pharo $DIRNAME/Zuul.image eval --no-quit 'GtkApplication ensureRunning. ZuulApplication open'
