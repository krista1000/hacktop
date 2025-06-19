printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
if sudo wg-quick up proton; then
  sleep 3
  IP=$(curl -s ifconfig.me)
  whiptail --title "VPN (WireGuard)" --msgbox "[✓] Proton WireGuard -yhteys muodostettu.\nIP: $IP" 10 60
else
  whiptail --title "VPN (WireGuard)" --msgbox "[!] Yhteyden muodostaminen epäonnistui." 8 60
fi
