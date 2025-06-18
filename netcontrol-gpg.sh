printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

EXPORT_DIR="$HOME/NetControl/exports"
ENCRYPTED_DIR="$HOME/NetControl/encrypted"

mkdir -p "$ENCRYPTED_DIR"

FILES=($(find "$EXPORT_DIR" -maxdepth 1 -name "*.ovpn"))

if [ ${#FILES[@]} -eq 0 ]; then
  whiptail --msgbox "⚠️ Ei löydetty .ovpn-tiedostoja encryptattavaksi hakemistosta:\n$EXPORT_DIR" 12 60
  exit 1
fi

MENU=()
for file in "${FILES[@]}"; do
  filename=$(basename "$file")
  MENU+=("$filename" "Encrypt")
done

SELECTED=$(whiptail --title "GPG-salaus" --menu "Valitse tiedosto salattavaksi:" 20 70 10 "${MENU[@]}" 3>&1 1>&2 2>&3)

if [ -n "$SELECTED" ]; then
  PASSPHRASE=$(whiptail --passwordbox "Syötä salasanalla suojattavan tiedoston salasana:" 10 60 3>&1 1>&2 2>&3)
  if [ -n "$PASSPHRASE" ]; then
    echo "$PASSPHRASE" | gpg --batch --yes --passphrase-fd 0 --symmetric --cipher-algo AES256 -o "$ENCRYPTED_DIR/$SELECTED.gpg" "$EXPORT_DIR/$SELECTED"
    whiptail --msgbox "✅ Tiedosto salattu ja tallennettu:\n$ENCRYPTED_DIR/$SELECTED.gpg" 10 70
  else
    whiptail --msgbox "❌ Salaus peruutettu – ei salasanaa." 10 50
  fi
fi
