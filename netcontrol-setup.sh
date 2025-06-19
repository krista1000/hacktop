printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

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

echo "[🛠️] Asennetaan Hacker Tools -työkalut..."
sudo apt update
sudo apt install -y whois nmap traceroute dnsutils dnsmap whatweb nikto theharvester
echo "[✔️] Hacker Tools asennettu!"
