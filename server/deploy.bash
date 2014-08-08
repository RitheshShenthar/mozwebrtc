#!/bin/bash

me=`basename $0`
my_dir=`dirname $0`

initd_dir="$my_dir/init.d"
aut_overlay_dir="$my_dir/aut-overlay"
tests_overlay_dir="$my_dir/tests-overlay"
etc_dir="$my_dir/etc"
bin_dir="$my_dir/bin"

echo "$me: Deploying overlay directories..."

cp -Rp "$aut_overlay_dir" "$HOME"
cp -Rp "$tests_overlay_dir" "$HOME"

echo "$me: Deploying etc directory..."

cp -Rp "$etc_dir" "$HOME"

echo "$me: Deploying bin directory..."

cp -Rp "$bin_dir" "$HOME"

echo "$me: Deploying service startup scripts..."

for script in `ls "$initd_dir"`; do
  echo "...$script..."
  sudo cp "$initd_dir/$script" "/etc/init.d/$script"
  sudo chmod 755 "/etc/init.d/$script"
  sudo update-rc.d "$script" defaults
done

echo "$me: Done!"
echo "Things for you to do:"
echo "1) Install any binaries referred to by service scripts"
echo "2) For each one, execute 'sudo service [name] start'"
echo "3) Install steeplechase"
echo "4) Modify these files with correct paths and IPs for your environment:"
echo "   ~/bin/steeplechase"
echo "   ~/bin/steeplechase-long"
echo "   ~/tests-overlay/steeplechase/tests/dom/media/tests/mochitest/turnConfig.js"
echo "5a) If you don't have a crontab already, execute 'crontab ~/etc/crontab.cron'"
echo "5b) If you do have a crontab already, merge in the contents of the above"
