#!/bin/bash

echo "📫 IP addresses 📫"
ip -br addr


echo -e "\n🌐 Default gateway 🌐"
ip route | grep -o "[^ ]* dev [^ ]*" 

echo -e "\n📗 DNS server(s) 📗"
resolvectl status | awk  '/Global/ || /Link [0-9]+/ {print $1, $3, $10}'