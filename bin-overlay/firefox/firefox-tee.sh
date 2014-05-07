#!/bin/sh

ROOT=`dirname $0`

$ROOT/firefox "$@" 2>/tmp/fx-stderr.log | tee /tmp/fx-stdout.log
