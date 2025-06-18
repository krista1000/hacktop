printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

# ASCII-banneri
echo "███████╗████████╗███████╗ █████╗ ██╗     ████████╗██╗  ██╗"
echo "██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║     ╚══██╔══╝╚██╗██╔╝"
echo "███████╗   ██║   █████╗  ███████║██║        ██║    ╚███╔╝ "
echo "╚════██║   ██║   ██╔══╝  ██╔══██║██║        ██║    ██╔██╗ "
echo "███████║   ██║   ███████╗██║  ██║███████╗   ██║   ██╔╝ ██╗"
echo "╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝"
echo
sleep 1

echo "[🛑] Katkaistaan Stealth-moodi:"

# Sammutetaan Tor
echo -n "🧅 Pysäytetään Tor: "
sudo systemctl stop tor && echo "OK" || echo "EPÄONNISTUI"

# Sammutetaan WireGuard
echo -n "🛡 Sammutetaan WireGuard (wg0): "
sudo wg-quick down wg0 && echo "OK" || echo "EPÄONNISTUI"

# Viesti
echo -e "\n✅ Stealth-moodi on katkaistu. Verkkoyhteytesi ovat nyt normaalit."
