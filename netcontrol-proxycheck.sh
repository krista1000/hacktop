printf '\e[8;30;80t'  # Aseta terminaalikoko 80x30
clear
echo "$ASCII"
echo
read -p "🔹 Paina Enter jatkaaksesi..." enter
clear
#!/bin/bash
list=$(whiptail --inputbox "Anna proxy-listan polku (esim. proxies.txt):" 10 60 3>&1 1>&2 2>&3)
[[ ! -f "$list" ]] && echo "[!] Lista puuttuu." && exit 1
for proxy in $(cat "$list"); do
  echo -n "$proxy → "
  curl -x "$proxy" -m 5 -s https://httpbin.org/ip || echo "FAIL"
done
