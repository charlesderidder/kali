# wget -q https://raw.githubusercontent.com/charlesderidder/kali/main/install.sh && sudo bash ./install.sh


      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
   MARK(){ $e "\e[7m";}
 UNMARK(){ $e "\e[27m";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;44m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 1 13);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 5
           $E "KALI MENU                                     ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 13 5
           printf "ENTER - SELECT,NEXT                       ";UNMARK;}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT  4 20; $e "Login informatie";}
     M1(){ TPUT  5 20; $e "Network informatie";}
     M2(){ TPUT  6 20; $e "Schijf informatie";}
     M3(){ TPUT  7 20; $e "IP Routing tabel";}
     M4(){ TPUT  8 20; $e "Tijd";}
     M5(){ TPUT  9 20; $e "Over  ";}
     M6(){ TPUT 10 20; $e "SLUITEN   ";}
      LM=6
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
     ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;$e "\n$(w        )\n";ES;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$(ifconfig )\n";ES;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;$e "\n$(df -h    )\n";ES;fi;;
        3) S=M3;SC;if [[ $cur == "" ]];then R;$e "\n$(route -n )\n";ES;fi;;
        4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$(date     )\n";ES;fi;;
        5) S=M5;SC;if [[ $cur == "" ]];then R;$e "\n$($e by oTo)\n";ES;fi;;
        6) S=M6;SC;if [[ $cur == "" ]];then R;exit 0;fi;;
 esac;POS;done
 
 
 
 
# https://github.com/keeganjk/kali-anonymous/blob/master/setup
echo ""
echo "ANONYMOUS SETUP FOR KALI LINUX ROLLING"
echo ""
printf "%s " "Press enter to continue"
echo ""
read -p "Moet Kali geupdate worden? [J/N] (Y als je dit niet zeker weet) " update
case $update in
	[Nn]* ) sudoapt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y; break;;
	[Yy]* ) break;;
       	* ) echo "You didn't type Y or n, aborting!"; break;;
esac;
echo "[+] Package list updated !"
printf "%s " "Press enter to continue"

clear


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



printf "%s " "Press enter to continue"

# Clear screen
# read ans

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








rm install.sh
