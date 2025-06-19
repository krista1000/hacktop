printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
case "$1" in
  start)
    if sudo systemctl restart tor; then
      whiptail --title "Tor" --msgbox "[✓] Tor käynnistetty." 8 40
    else
      whiptail --title "Tor" --msgbox "[!] Tor käynnistys epäonnistui." 8 50
    fi
    ;;
  stop)
    if sudo systemctl stop tor; then
      whiptail --title "Tor" --msgbox "[✓] Tor pysäytetty." 8 40
    else
      whiptail --title "Tor" --msgbox "[!] Tor pysäytys epäonnistui." 8 50
    fi
    ;;
esac
