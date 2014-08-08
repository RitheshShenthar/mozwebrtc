#!/bin/bash

me=`basename $0`
my_dir=`dirname $0`

initd_dir="$my_dir/init.d"

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
