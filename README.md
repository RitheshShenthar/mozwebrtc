Customizations for the Mozilla QA WebRTC Cluster

* bin-overlay/*: files overlaid onto Firefox binary distribution
* tests-overlay/*: files overload onto Firefox tests distribution

The above go on the server, in ~. Make sure to chmod 755 bin/firefox-tee.sh

* steeplechase.sh: execution script for standard steeplechase
* steeplechase-long.sh: execution script for endurance steeplechase
* update-nightly.bash: execution script to update firefox bin and tests

The above go on the server, in ~. chmod 755 all. They expect ~/bin and ~/tests to be created, and the two overlay directories above to be present.

* crontab: crontab to execute update and steeplechase

The crontab should be installed on the server as the user.

* init.d/client: init.d scripts for the clients
* init.d/server: init.d scripts for the servers

These should be put in /etc/init.d for the clients and server respectively. chmod 755 all init.d scripts as root.
