# Customizations for the Mozilla QA WebRTC Cluster

## Clients

* client/init.d/*: init scripts for the clients

These should be put in /etc/init.d on each client. chmod 755 all init.d scripts as root. Afterwards, run 'sudo update-rc.d [script name] defaults' for each script.

## Server

* server/aut-overlay
* server/bin
* server/etc
* server/tests-overlay

These trees should be copied to the home directory

* server/etc/crontab.cron: crontab to execute update and steeplechase

This should be staged with 'crontab server/etc/crontab.cron'

* server/init.d/*: init scripts for the clients

These should be put in /etc/init.d on the server. chmod 755 all init.d scripts as root. Afterwards, run 'sudo update-rc.d [script name] defaults' for each script.

* server/bin/steeplechase
* server/bin/steeplechase-long
* server/tests-overlay/steeplechase/tests/dom/media/tests/mochitest/turnConfig.js: local turn servers

These should be modified with correct host information for clients, signaling server, and TURN server.

## Usage

With the given crontab, jobs will execute at 2AM (update) and 2:30AM (test run). Logs will be created in a directory called ~/logs on both server and client, and rotated automatically.

The bin directory contains several scripts:

steeplechase: runs the standard steeplechase run against ~/aut and ~/tests (no client logging, no long-running tests)
steeplechase-long: runs the long-running steeplechase tests against ~/aut and ~/tests, with logging
update-nightly: downloads the latest firefox and test bundle, stages into ~/aut and ~/tests, and applies the overlays.
