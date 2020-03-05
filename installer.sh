#!/usr/bin/env sh

if ! systemctl --version >/dev/null; then
  echo "systemctl not found on this system. Can't go on. Exiting with status 127."
  exit 127
fi

# cp the core
sudo cp example-daemon /usr/bin/

# cp the unit file
sudo cp example-daemon.service /etc/systemd/system/

#start the service
sudo systemctl daemon-reload
sudo systemctl start example-daemon.service
sudo systemctl status example-daemon.service

printf "\nExeecute 'sudo systemctl stop example-daemon.service' to stop the daemon.\n"
echo "Exeecute 'sudo systemctl enable example-daemon.service' to enable auto startup."
echo "Execute 'sudo systemctl disable example-daemon.service' to disable auto startup."
echo "Execute 'sudo systemctl -l example-daemon.service' to see daemon's logs."
echo "Execute 'sudo journalctl -u example-daemon.service -f' to tail daemon's logs through journalctl."

exit 0