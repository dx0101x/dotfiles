#!/bin/bash

set -e

# GNOME Privacy
gsettings set org.gnome.desktop.privacy old-files-age 0
gsettings set org.gnome.desktop.privacy remember-app-usage false
gsettings set org.gnome.desktop.privacy remember-recent-files false

# GNOME Window Manager
gsettings set org.gnome.desktop.wm.preferences button-layout ':'

# Nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences fts-enabled false
gsettings set org.gnome.nautilus.preferences migrated-gtk-settings true
gsettings set org.gnome.nautilus.preferences recursive-search 'never'

echo "GNOME settings applied successfully."
