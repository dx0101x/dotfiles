#!/bin/bash

# This script installs the Chaotic AUR repository on Arch Linux

# Exit on any error
set -e

# Display a message
echo "Starting Chaotic AUR installation..."

# Retrieve the primary key for the Chaotic AUR repository
echo "Receiving Chaotic AUR key..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com

# Sign the key locally
echo "Signing Chaotic AUR key..."
sudo pacman-key --lsign-key 3056513887B78AEB

# Install the Chaotic AUR keyring package
echo "Installing Chaotic AUR keyring..."
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'

# Install the Chaotic AUR mirrorlist package
echo "Installing Chaotic AUR mirrorlist..."
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Check if Chaotic AUR repository is already in /etc/pacman.conf
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    echo "Updating /etc/pacman.conf..."
    sudo tee -a /etc/pacman.conf <<EOF

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
else
    echo "Chaotic AUR repository is already present in /etc/pacman.conf."
fi

# Refresh package database
echo "Refreshing package database..."
sudo pacman -Syy

echo "Chaotic AUR installation complete!"

