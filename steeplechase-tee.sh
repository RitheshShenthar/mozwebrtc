#!/bin/sh

/usr/bin/env python ~/src/steeplechase/steeplechase/runsteeplechase.py --binary ~/bin/firefox/firefox-tee.sh --specialpowers-path ~/tests/steeplechase/specialpowers --prefs-file ~/tests/steeplechase/prefs_general.js --signalling-server 'http://10.252.73.224:8080/' --html-manifest ~/tests/steeplechase/tests/dom/media/tests/mochitest/steeplechase_long.ini --host1 10.252.73.222:20701 --host2 10.252.73.223:20701
