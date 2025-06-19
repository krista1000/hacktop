printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
if sudo wg-quick down proton; then
  whiptail --title "VPN (WireGuard)" --msgbox "[✓] Proton WireGuard -yhteys katkaistu." 8 60
else
  whiptail --title "VPN (WireGuard)" --msgbox "[!] Katkaisu epäonnistui." 8 50
fi
