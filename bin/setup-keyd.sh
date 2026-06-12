#!/usr/bin/env bash
set -euo pipefail

KEYD_SOURCE="$HOME/.config/keyd/default.conf"

if [ ! -f "$KEYD_SOURCE" ]; then
  echo "Error: $KEYD_SOURCE not found. Run home-manager switch first."
  exit 1
fi

sudo cp "$KEYD_SOURCE" /etc/keyd/default.conf
sudo systemctl restart keyd
echo "keyd config applied and reloaded"

echo "Disabling GNOME/Dock Super+number shortcuts..."
for i in $(seq 1 9); do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "[]"
  gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-$i "[]"
  gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-$i "[]"
done
echo "GNOME shortcuts cleared"
