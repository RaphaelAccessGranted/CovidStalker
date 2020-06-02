#!/bin/bash

echo -e "\e[0;32m**********************************************"
echo -e "\e[0;31m\e[4mNOMBRE DE LA RED:\e[0m"
cat cap-01.kismet.netxml |grep essid | awk -F">" '{print $2}' | awk -F"<" '{print $1}'
echo " "
echo -e "\e[0;31m\e[4mDIRECCIÓN MAC DEL AP:\e[0m"
cat cap-01.kismet.netxml |grep BSSID | awk -F">" '{print $2}' | awk -F"<" '{print $1}'
echo " "
echo -e "\e[0;31m\e[4mNÚMERO DE PERSONAS EN EL DOMICILIO:\e[0m"
cat cap-01.kismet.netxml |grep client-mac | awk -F">" '{print $2}' | awk -F"<" '{print NR}' | awk 'BEGIN{FS="\n"; RS=""}{print NF}'
echo " "
echo -e "\e[0;31m\e[4mFECHA Y HORA DEL ESCANEO:\e[0m"
cat cap-01.kismet.netxml |grep first-time |grep wireless-network | awk -F'="' '{print $4}' | awk -F'"' '{print $1}' | awk '{print $1, $3 "/" $2 "/" $5, "... A las", $4}'
echo " "
echo -e "\e[0;31m\e[4mTÉRMINO  DEL ESCANEO:\e[0m"
cat cap-01.kismet.netxml |grep "SSID first-time" | awk -F'last-time="' '{print $2}' | awk -F'">' '{print $1}' | awk '{print $1, $3 "/" $2 "/" $5, "... A las", $4}'
echo " "
echo -e "\e[0;31m\e[4mDISPOSITIVOS CONECTADOS A LA RED:\e[0m"
cat cap-01.kismet.netxml |grep manuf | awk -F">" '{print $2}' | awk -F"<" '{print NR-1"->", $1}'
echo " "
echo -e "\e[0;36mUNKNOWN??? INFORMACIÓN MÃS DETALLADA EN:"
echo -e "\e[0;36mhttps://hwaddress.com"
echo " "
echo -e "\e[0;31m\e[4mDIRECCIONES MAC DE LOS DISPOSITIVOS:\e[0m"
cat cap-01.kismet.netxml |grep client-mac | awk -F">" '{print $2}' | awk -F"<" '{print NR"->", $1}'
echo -e "\e[0;32m**********************************************"
