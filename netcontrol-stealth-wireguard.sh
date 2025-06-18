printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
if sudo systemctl restart tor && sudo wg-quick up proton; then
  sleep 3
  IP=$(curl -s ifconfig.me)
  whiptail --title "Stealth-moodi (WireGuard + Tor)" --msgbox "[✓] Stealth-moodi käynnistetty.\nVPN IP: $IP" 10 60
else
  whiptail --title "Stealth-moodi" --msgbox "[!] Käynnistys epäonnistui. Tarkista Tor ja WireGuard." 10 60
fi
