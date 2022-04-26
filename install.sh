# update Kali door "update" in command line in te typen
# sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean > update && sudo mv update /usr/local/bin/update && sudo chmod +x /usr/local/bin/update

# sudo apt update
# echo ""
# Will show your public facing IP Address
echo "WAN IP Address is:" 
dig +short myip.opendns.com @resolver1.opendns.com
