#!/bin/bash

ZUULPATH=`dirname $0`

$ZUULPATH/pharo $ZUULPATH/Zuul.image eval --no-quit 'GtkApplication ensureRunning. ZuulApplication open'
