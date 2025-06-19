printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

DESKTOP_FILE=~/Desktop/NetControl.desktop

cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Name=NetControl
Comment=Kali Linux Network Control Center
Exec=gnome-terminal -- bash -c 'bash ~/NetControl/netcontrol.sh; exec bash'
Icon=utilities-terminal
Terminal=true
Type=Application
Categories=Network;Security;
EOF

chmod +x "$DESKTOP_FILE"
echo "[✓] Työpöytäkuvake luotu: $DESKTOP_FILE"
