#!/bin/bash
echo "Copying monitoring script..."
sudo cp monitoring.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/monitoring.sh

echo "Copying systemd files..."
sudo cp monitoring.service /etc/systemd/system/
sudo cp monitoring.timer /etc/systemd/system/

echo "Creating log file..."
sudo touch /var/log/monitoring.log
sudo chmod 644 /var/log/monitoring.log

echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Enabling timer..."
sudo systemctl enable monitoring.timer
sudo systemctl start monitoring.timer

echo "Installation complete!"
