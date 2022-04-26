# wget -q https://raw.githubusercontent.com/charlesderidder/kali/main/install.sh && sudo bash ./install.sh

# First run
#sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y


# Run next time only enter update in commandline
echo "sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean" > update && sudo mv update /usr/local/bin/update && sudo chmod +x /usr/local/bin/update

# Install Docker // CHANGE USERNAME!
sudo apt update sudo apt install -y docker.io sudo systemctl enable docker --now sudo usermod -aG docker charlesderidder

# Install Portainer // CHANGE PORT
# docker volume create portainer_data docker run -d -p 8000:8000 -p 9443:9443 --name portainer \ --restart=always \ -v /var/run/docker.sock:/var/run/docker.sock \ -v portainer_data:/data \ portainer/portainer-ce:2.9.3

clear
echo -e "TEST\n2eTEST\n"
alias cls='printf "\033c"'
curl ipecho.net/plain

echo -e "\n"
ls -lart
rm install.sh
