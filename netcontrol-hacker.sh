#!/bin/bash

# Terminaalikoko ja ASCII
printf '\e[8;30;80t'
clear
ASCII=$(cat HACKTOP_ASCII_FIXED.txt 2>/dev/null)
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi Hacker Tools -valikkoon..." enter
clear

# Valikko
while true; do
CHOICE=$(dialog --clear --backtitle "HackTop - Hacker Tools" \
--title "Hacker Tools" \
--menu "Valitse työkalu:" 20 60 10 \
1 "whois" \
2 "nmap" \
3 "traceroute" \
4 "dig" \
5 "dnsmap" \
6 "whatweb" \
7 "nikto" \
8 "theHarvester" \
9 "Poistu" \
3>&1 1>&2 2>&3)

clear
case $CHOICE in
  1)
    read -p "Anna domain tai IP: " target
    whois "$target" | head -n 40
    ;;
  2)
    read -p "Anna IP tai domain: " target
    nmap -Pn "$target"
    ;;
  3)
    read -p "Anna kohde: " target
    traceroute "$target"
    ;;
  4)
    read -p "Anna domain: " target
    dig "$target" ANY +short
    ;;
  5)
    read -p "Anna domain: " target
    dnsmap "$target"
    ;;
  6)
    read -p "Anna URL (esim. https://sivu.fi): " target
    whatweb "$target"
    ;;
  7)
    read -p "Anna URL (esim. http://sivu.fi): " target
    nikto -h "$target"
    ;;
  8)
    read -p "Anna domain: " target
    theHarvester -d "$target" -b google
    ;;
  9)
    break
    ;;
esac
echo
read -p "Paina Enter palataksesi valikkoon..."
done
