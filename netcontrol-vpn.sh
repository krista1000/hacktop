printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
sudo pkill openvpn &>/dev/null
sudo openvpn --config /etc/openvpn/client/protonvpn.conf \
  --daemon --script-security 2 \
  --up /etc/openvpn/update-resolv-conf \
  --down /etc/openvpn/update-resolv-conf \
  --log /tmp/openvpn.log

sleep 5

if ip a | grep -q tun0; then
  whiptail --title "VPN" --msgbox "[✓] ProtonVPN yhteys muodostettu.\nIP: $(curl -s ifconfig.me)" 10 60
else
  whiptail --title "VPN" --msgbox "[!] ProtonVPN epäonnistui.\nKatso /tmp/openvpn.log" 10 60
fi
