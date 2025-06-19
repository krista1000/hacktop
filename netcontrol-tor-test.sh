printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

# Testaa Tor-yhteyden toimivuuden käyttämällä check.torproject.org
if torsocks curl -s https://check.torproject.org | grep -q "Congratulations"; then
  whiptail --title "Tor-testi" --msgbox "[✓] Tor-yhteys toimii!
Olet Tor-verkossa." 8 50
else
  whiptail --title "Tor-testi" --msgbox "[✗] Tor-yhteys ei toimi.
Et ole Tor-verkossa." 8 50
fi
