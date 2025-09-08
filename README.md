# Process Monitoring Solution

Bash script for monitoring 'test' process in Linux environment with systemd integration.

## Features
- Autostart on system boot
- Runs every minute
- HTTPS monitoring requests
- Logging to /var/log/monitoring.log
- Systemd service and timer units

## Files
- `monitoring.sh` - Main monitoring script
- `monitoring.service` - Systemd service unit  
- `monitoring.timer` - Systemd timer unit

## Installation
```bash
# Copy files
sudo cp monitoring.sh /usr/local/bin/
sudo cp monitoring.service /etc/systemd/system/
sudo cp monitoring.timer /etc/systemd/system/

# Set permissions
sudo chmod +x /usr/local/bin/monitoring.sh
sudo touch /var/log/monitoring.log
sudo chmod 644 /var/log/monitoring.log

# Enable and start
sudo systemctl daemon-reload
sudo systemctl enable monitoring.timer
sudo systemctl start monitoring.timer
