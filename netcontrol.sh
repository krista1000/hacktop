#!/bin/bash
ASCII=$(cat ~/NetControl/HACKTOP_ASCII.txt)
printf '\e[8;28;80t'  # Aseta terminaalin koko 80x28
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
clear
echo "$ASCII"
sleep 2

sed -i 's|~/NetControl/HACKTOP_ASCII.txt|~/NetControl/HACKTOP_ASCII.txt|' ~/NetControl/netcontrol.sh

HEIGHT=20
WIDTH=60
CHOICE_HEIGHT=20
TITLE="===  HACKTOP  ==="
BACKTITLE="HackTop Control Menu"


clear
echo "$ASCII"
sleep 2

while true; do
CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "Valitse toiminto:" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                1 "Stealth-moodi (WireGuard + Tor)" \
                2 "Yhdistä WireGuard VPN" \
                3 "Katkaise WireGuard VPN" \
                4 "Kill-switch päälle" \
                5 "Kill-switch pois" \
                6 "Käynnistä Tor" \
                7 "Pysäytä Tor" \
                8 "Tor-testi" \
                9 "Vaihda MAC-osoite" \
                10 "Nmap porttiskannaus" \
                11 "Proxy-checker" \
                12 "Hacker Tools" \
                13 "Luo työpöytäkuvake" \
                14 "Päivitä NetControl (manual)" \
                0 "Poistu" \
                3>&1 1>&2 2>&3)

clear
case $CHOICE in
1)
#!/bin/bash
if sudo systemctl restart tor && sudo wg-quick up proton; then
  sleep 3
  IP=$(curl -s ifconfig.me)
  whiptail --title "Stealth-moodi (WireGuard + Tor)" --msgbox "[✓] Stealth-moodi käynnistetty.\nVPN IP: $IP" 10 60
else
  whiptail --title "Stealth-moodi" --msgbox "[!] Käynnistys epäonnistui. Tarkista Tor ja WireGuard." 10 60
fi
    ;;
2)
#!/bin/bash
if sudo wg-quick up proton; then
  sleep 3
  IP=$(curl -s ifconfig.me)
  whiptail --title "VPN (WireGuard)" --msgbox "[✓] Proton WireGuard -yhteys muodostettu.\nIP: $IP" 10 60
else
  whiptail --title "VPN (WireGuard)" --msgbox "[!] Yhteyden muodostaminen epäonnistui." 8 60
fi
    ;;
3)
#!/bin/bash
if sudo wg-quick down proton; then
  whiptail --title "VPN (WireGuard)" --msgbox "[✓] Proton WireGuard -yhteys katkaistu." 8 60
else
  whiptail --title "VPN (WireGuard)" --msgbox "[!] Katkaisu epäonnistui." 8 50
fi
    ;;
4)
echo 'Killswitch päälle (toiminto lisättävä erikseen)'
    ;;
5)
echo 'Killswitch pois (toiminto lisättävä erikseen)'
    ;;
6)
# Torin käynnistys
echo "[+] Käynnistetään Tor..."
sudo systemctl start tor
echo "[+] Tor käynnistetty."
    ;;
7)
# Torin pysäytys
echo "[+] Pysäytetään Tor..."
sudo systemctl stop tor
echo "[+] Tor pysäytetty."
    ;;
8)
# Tor-testi (curl .onion)
echo "[+] Suoritetaan Tor-testi (curl https://check.torproject.org)..."
RESULT=$(curl -s --socks5-hostname 127.0.0.1:9050 https://check.torproject.org | grep -q "Congratulations" && echo "[✓] Tor on käytössä" || echo "[✗] Tor EI ole käytössä")
whiptail --title "Tor-testi" --msgbox "$RESULT" 10 50
    ;;
9)
# MAC-osoitteen vaihtaminen (macchanger)
IFACE=$(ip link | awk -F: '$0 !~ "lo|vir|docker|^[^0-9]"{print $2;getline}')
echo "[+] Vaihdetaan MAC-osoite laitteelle $IFACE..."
sudo ip link set $IFACE down
sudo macchanger -r $IFACE
sudo ip link set $IFACE up
    ;;
10)
# Nmap-porttiskannaus
read -p "Anna kohde (IP tai domain): " TARGET
echo "[+] Skannataan portit kohteesta $TARGET..."
nmap -Pn $TARGET
    ;;
11)
# Proxy-checker placeholder
read -p "Syötä proxy (IP:PORT): " PROXY
echo "[+] Tarkistetaan proxy $PROXY..."
curl -x $PROXY https://ifconfig.me || echo "Proxy ei toimi."
    ;;
12)
# Käynnistä Hacker Tools -skripti
bash ~/NetControl/netcontrol-hacker.sh
;;
13)
#!/bin/bash

ASCII=$(cat ~/NetControl/HACKTOP_ASCII.txt)

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
    ;;
14)
#!/bin/bash

ASCII=$(cat ~/NetControl/HACKTOP_ASCII.txt)

echo "[✓] Aloitetaan HackTop 1.0 -asennus..."

# Luo NetControl-kansio
mkdir -p ~/NetControl/exports ~/NetControl/encrypted

# Siirrä ladatut .sh-skriptit paikalleen (oletetaan että ne ovat Downloads-kansiossa)
cp ~/Downloads/netcontrol-*.sh ~/NetControl/
chmod +x ~/NetControl/netcontrol-*.sh

# Aseta .zshrc
cp ~/Downloads/zshrc-hacktop-fullinfo.sh ~/.zshrc
chmod 644 ~/.zshrc

# Asenna tarvittavat paketit
echo "[✓] Tarkistetaan riippuvuudet..."
sudo apt update
sudo apt install -y neofetch nload curl iputils-ping dnsutils whiptail gnome-terminal

# Luo työpöytäkuvake
bash ~/NetControl/netcontrol-shortcut.sh

echo "[✓] Asennus valmis!"
echo "→ Avaa uusi terminaali tai kirjoita: bash ~/NetControl/netcontrol.sh"
echo "→ Tietokoneen tiedot näkyvät heti käynnistyksessä"

read -p "Paina Enter käynnistääksesi uuden terminaalin..."
gnome-terminal -- bash -c "bash ~/NetControl/netcontrol.sh; exec bash"
    ;;

0)
    echo "Poistutaan..."
    exit 0
    ;;
*)
    echo "Tuntematon valinta"
    ;;
15)
    bash netcontrol-stealth-stop.sh
    ;;
esac

clear
echo "$ASCII"
sleep 2

done
