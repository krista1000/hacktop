printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash

check_connection() {
  ping -c 1 1.1.1.1 &>/dev/null
  return $?
}

check_dns() {
  host dnsleaktest.com &>/dev/null
  return $?
}

check_vpn() {
  ip link show tun0 &>/dev/null
  return $?
}

get_ip() {
  curl -s ifconfig.me
}

# Run checks
if ! check_connection; then
  whiptail --msgbox "❌ Verkkoyhteyttä ei ole. Tarkista fyysinen tai langaton yhteys." 10 70
  exit 1
fi

if ! check_dns; then
  whiptail --msgbox "⚠️ DNS ei toimi. Mahdollinen ongelma resolv.conf- tai kill switch -asetuksissa." 10 70
  exit 1
fi

if ! check_vpn; then
  whiptail --msgbox "⚠️ VPN-tunnelia (tun0) ei havaittu. Oletko yhdistänyt VPN:n?" 10 70
  exit 1
fi

IP=$(get_ip)
if [ -z "$IP" ]; then
  whiptail --msgbox "❌ IP-osoitteen haku epäonnistui. Tarkista yhteys tai VPN:n tila." 10 70
else
  whiptail --msgbox "🔍 DNS Leak Test OK\nHavaittu ulkoinen IP: $IP\nVarmista että IP kuuluu VPN:lle." 12 70
fi
