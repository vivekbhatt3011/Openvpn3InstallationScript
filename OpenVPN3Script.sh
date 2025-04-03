#!/bin/bash

# Define variables
CONFIG_PATH="/path/to/your-vpn.ovpn"

# Update system and install dependencies
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt install -y curl openvpn3

# Add OpenVPN3 repository
echo "Adding OpenVPN3 repository..."
sudo curl -fsSL https://packages.openvpn.net/packages-repo.gpg | sudo tee /usr/share/keyrings/openvpn-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/openvpn-keyring.asc] https://packages.openvpn.net/openvpn3/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/openvpn-packages.list

# Install OpenVPN3
echo "Installing OpenVPN3..."
sudo apt update && sudo apt install -y openvpn3

# Verify installation
echo "Verifying OpenVPN3 installation..."
openvpn3 version

# Import VPN configuration
echo "Importing OpenVPN configuration..."
openvpn3 config-import --config "$CONFIG_PATH"

# Start VPN session
echo "Starting VPN session..."
openvpn3 session-start --config "$CONFIG_PATH"

# Display active VPN sessions
echo "Checking active VPN sessions..."
openvpn3 sessions-list

echo "OpenVPN3 setup and connection complete!"
