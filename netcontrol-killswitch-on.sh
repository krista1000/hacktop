printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
if sudo iptables -P OUTPUT DROP && sudo iptables -A OUTPUT -o tun0 -j ACCEPT; then
  whiptail --title "Kill Switch" --msgbox "[✓] Kill Switch on päällä – kaikki muu estetty." 8 60
else
  whiptail --title "Kill Switch" --msgbox "[!] Kill Switch ei onnistunut." 8 50
fi
