#!/bin/bash

#set -x

MOZWEBRTC=$HOME/mozwebrtc

AUT_OVERLAY=$HOME/aut-overlay
TESTS_OVERLAY=$HOME/tests-overlay

cd $MOZWEBRTC/server
cp -r aut-overlay/* $AUT_OVERLAY
cp -r tests-overlay/* $TESTS_OVERLAY
