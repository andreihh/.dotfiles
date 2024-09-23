#!/bin/bash -e

# Configures various system settings (keyboard layout, dark mode, etc.).

[[ $# -gt 0 ]] && echo "Usage: $0" && exit 1

echo "Updating system settings..."

echo "Setting keyboard layout to US..."
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us')]"

echo "Swapping Caps Lock and Esc keys..."
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

echo "Removing Alt-Esc system key mapping..."
gsettings set org.gnome.desktop.wm.keybindings cycle-windows "[]"

echo "Replacing Super with Alt in the switch applications shortcuts..."
gsettings set org.gnome.desktop.wm.keybindings switch-applications \
  "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward \
  "['<Alt><Control>Tab']"

echo "Replacing Alt with Super in the switch windows shortcuts..."
gsettings set org.gnome.desktop.wm.keybindings switch-windows \
  "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward \
  "['<Shift><Super>Tab']"

echo "Setting system theme to dark mode..."
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "Making hidden startup applications visible..."
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

echo "System settings updated!"
