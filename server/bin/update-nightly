#!/bin/bash

set -e # stop on error

bin_glob='firefox-*.en-US.linux-x86_64.tar.bz2'
tests_glob='firefox-*.en-US.linux-x86_64.tests.zip'

bin_dir=$HOME/bin
tests_dir=$HOME/tests

bin_overlay=$HOME/bin-overlay
tests_overlay=$HOME/tests-overlay

me=`basename $0`

echo $me: creating temp directory...
temp_dir=`mktemp -d rtc.XXXXXXXXXX --tmpdir`
cd $temp_dir
echo $me: created $temp_dir... 

set -f # disable globbing
echo $me: downloading binary...
wget ftp.mozilla.org:pub/mozilla.org/firefox/nightly/latest-trunk/$bin_glob

echo $me: downloading tests...
wget ftp.mozilla.org:pub/mozilla.org/firefox/nightly/latest-trunk/$tests_glob
set +f # re-enable globbing

echo $me: cleaning up extraneous versions...
# extraneous == older versions if also present in ftp dir, so anything but last, sorted
ls -1r $bin_glob | tail -n +2 | xargs -r rm
ls -1r $tests_glob | tail -n +2 | xargs -r rm

# deleted all but one of each, so the one left is the target file.
# If nothing was downloaded this will abort due to the set -e.
bin_file=`ls $bin_glob`
tests_file=`ls $tests_glob`

echo $me: cleaning up previous deployment...
cd $bin_dir
rm -rf *
cd $tests_dir
rm -rf *

echo $me: deploying binary...
cd $bin_dir
cp $temp_dir/$bin_file .
tar xjvf ./$bin_file

echo $me: deploying tests...
cd $tests_dir
cp $temp_dir/$tests_file .
unzip ./$tests_file

echo $me: applying overlays...
cd $bin_dir
cp -R $bin_overlay/* .
cd $tests_dir
cp -R $tests_overlay/* .

echo $me: cleaning up temp directory...
rm -rf $temp_dir

echo $me: done!

