# wget -q https://raw.githubusercontent.com/charlesderidder/kali/main/install.sh && sudo bash ./install.sh

# First run
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# Run next time only enter update in commandline
# echo "sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean" > update && sudo mv update /usr/local/bin/update && sudo chmod +x /usr/local/bin/update

# Install Docker // CHANGE USERNAME!
sudo apt update 
sudo apt install -y docker.io 
sudo systemctl enable docker --now 
sudo usermod -aG docker charlesderidder

# Install Portainer // CHANGE PORT
# docker volume create portainer_data docker run -d -p 8000:8000 -p 9443:9443 --name portainer \ --restart=always \ -v /var/run/docker.sock:/var/run/docker.sock \ -v portainer_data:/data \ portainer/portainer-ce:2.9.3

#clear
#echo -e "TEST\n2eTEST\n"

echo -e "\n"
echo "IP-adres:"
curl ipecho.net/plain

echo -e "\n"

rm install.sh

printf "%s " "Press enter to continue"
read ans

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
# BACKTITLE="Backtitle here"
TITLE="Maak je keuze"
MENU="Kies een van de volgende opties:"

OPTIONS=(1 "Update Kali"
         2 "Option 2"
         3 "Option 3")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "You chose Option 1"
            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo "You chose Option 3"
            ;;
esac
