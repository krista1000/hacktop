printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
if sudo iptables -F && sudo iptables -P OUTPUT ACCEPT; then
  whiptail --title "Kill Switch" --msgbox "[✓] Kill Switch pois päältä – liikenne vapautettu." 8 60
else
  whiptail --title "Kill Switch" --msgbox "[!] Poisto epäonnistui." 8 50
fi
