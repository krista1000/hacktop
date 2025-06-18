printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

# ASCII-banneri (lyhyt)
echo "██████╗ ███████╗ ██████╗██╗  ██╗████████╗ ██████╗ ██╗     "
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██║     "
echo "██████╔╝█████╗  ██║     █████╔╝    ██║   ██║   ██║██║     "
echo "██╔═══╝ ██╔══╝  ██║     ██╔═██╗    ██║   ██║   ██║██║     "
echo "██║     ███████╗╚██████╗██║  ██╗   ██║   ╚██████╔╝███████╗"
echo "╚═╝     ╚══════╝ ╚═════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝"
echo
sleep 1

# Tarkistetaan Tor
echo "[🧅] Tor-palvelun tila:"
systemctl is-active tor

# Tarkistetaan WireGuard
echo -e "\n[🛡] WireGuard-yhteys:"
wg show || echo "WireGuard ei ole päällä tai asennettu"

# Tarkistetaan ulkoinen IP
echo -e "\n[🌐] Ulkoinen IP:"
curl -s ifconfig.me || echo "IP-osoitetta ei voitu hakea"

# Tarkistetaan DNS leak -moduuli
echo -e "\n[🔎] DNS vuototesti (dnsleaktest.com):"
curl -s https://www.dnsleaktest.com/ | grep -i "IP" | head -n 5 || echo "DNS-leak test epäonnistui"

# Tarkistetaan Kill switch
echo -e "\n[🔒] Kill-switch tila (iptables):"
iptables -L OUTPUT -v -n | head -n 10

echo -e "\n✅ Tilan tarkistus valmis."
