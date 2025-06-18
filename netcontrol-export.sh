printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

CONFIG_DIR="/home/kaliningrad/client-configs/files"
EXPORT_DIR="$HOME/NetControl/exports"

mkdir -p "$EXPORT_DIR"

FILES=($(find "$CONFIG_DIR" -maxdepth 1 -name "*.ovpn"))

if [ ${#FILES[@]} -eq 0 ]; then
  whiptail --msgbox "Ei löytynyt yhtään .ovpn-tiedostoa hakemistosta:\n$CONFIG_DIR" 12 60
  exit 1
fi

MENU=()
for file in "${FILES[@]}"; do
  filename=$(basename "$file")
  MENU+=("$filename" "Export")
done

SELECTED=$(whiptail --title "VPN Client Export" --menu "Valitse .ovpn-tiedosto exportoitavaksi:" 20 70 10 "${MENU[@]}" 3>&1 1>&2 2>&3)

if [ -n "$SELECTED" ]; then
  cp "$CONFIG_DIR/$SELECTED" "$EXPORT_DIR/$SELECTED"
  whiptail --msgbox "Tiedosto kopioitu kohteeseen:\n$EXPORT_DIR/$SELECTED" 10 60
fi
