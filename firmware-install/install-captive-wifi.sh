#!/bin/bash
# install-captive-wifi.sh
# Run this script using: sudo bash install-captive-wifi.sh

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script with sudo."
  exit 1
fi

echo "=========================================="
echo "Installing SSH Hotspot Fallback for Armbian"
echo "=========================================="

# 1. Create the fallback script
echo "Creating hotspot script at /usr/local/bin/autohotspot.sh..."
cat << 'EOF' > /usr/local/bin/autohotspot.sh
#!/bin/bash

# Give NetworkManager 25 seconds to find home/remote APs naturally
sleep 25

# Check if wlan0 successfully received an IP address
if ip addr show dev wlan0 | grep -q "inet "; then
    echo "Connected to an existing Wi-Fi network. Exiting."
    exit 0
fi

echo "Configured Wi-Fi networks not found. Launching SSH Hotspot..."

# Launch a persistent unmanaged hotspot profile via NetworkManager
# Defaults the board IP to 10.42.0.1 and starts its internal DHCP server
nmcli dev wifi hotspot ssid "SkyTing-1090" password "password" ifname wlan0
EOF

# Make the fallback script executable
chmod +x /usr/local/bin/autohotspot.sh

# 2. Create the systemd boot service
echo "Creating systemd service at /etc/systemd/system/autohotspot.service..."
cat << 'EOF' > /etc/systemd/system/autohotspot.service
[Unit]
Description=Switch to Hotspot if configured networks are missing
After=NetworkManager.service
Wants=NetworkManager.service

[Service]
Type=oneshot
ExecStart=/usr/local/bin/autohotspot.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# 3. Enable the service
echo "Reloading systemd and enabling autohotspot service..."
systemctl daemon-reload
systemctl enable autohotspot.service

echo "=========================================="
echo "Installation complete!"
echo "If your board boots and can't find its configured Wi-Fi,"
echo "it will host 'ADSB-Fallback-SSH' (Password123)."
echo "You can then SSH in using: ssh armbian@10.42.0.1"
echo "=========================================="
