RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
DEFAULT_FG="$(printf '\033[39m')"  DEFAULT_BG="$(printf '\033[49m')"

cd && AdminHack && bash src/Sevrite.sh
clear
echo "${BLUE}------------ ---------"
echo "| ${RED} Select Option ${BLUE}     |"
echo "|------- ----  -------|"
echo "| ${GREEN}1. Termux ${BLUE} "
echo "| ${GREEN}2. Linux ${BLUE} "
echo "| ${GREEN}3. Kali Linux ${BLUE} "
echo "|                     |"
echo "| ${RED}While 1/2/3:${BLUE}        |"
echo "----  ---------- ------     "
read numb
clear
echo "${BLUE}------------ ---------"
echo "| ${RED} Select Option ${BLUE}     |"
echo "|------- ----  -------|"
echo "| ${CYAN}1. Termux ${BLUE} "
echo "| ${CYAN}2. Linux ${BLUE} "
echo "| ${CYAN}3. Kali Linux ${BLUE} "
echo "|                     |"
echo "| ${RED}While 1/2/3:${BLUE}        |"
echo "----  ---------- ------     "
if [ $numb = "1" ]
then
        echo -n "${BLUE}[${RED}!${BLUE}] ${GREEN}Loading Installing In Termux..."
	echo ""
	pkg upgrade && pkg update
	pkg install python3
	pkg install php
	pkg install toilet
	pkg install python
	python3 -m pip install requests
	python3 -m pip install smtp
	sleep 0.8
	echo -n "${BLUE}[${GREEN}+${BLUE}] ${GREEN}Succesful Installed..!"
	echo ""
else
        if [ $numb = "2" ]
        then
                echo -n "${BLUE}[${RED}!${BLUE}] ${GREEN}Loading Installing In Linux..."
		echo ""
		apt upgrade && apt update
		apt install python3
		apt install php
		apt install toilet
		apt install python
		pip3 install requests
		pip3 install smtp
		sleep 1
		echo -n "${BLUE}[${GREEN}+${BLUE}] ${GREEN}Succesful Installed..!"
		echo ""
	else
		if [ $numb = "3" ]
		then
			echo -n "${BLUE}[${RED}!${BLUE}] ${GREEN}Loading Installing In NetHunter..."
			echo ""
			sudo su
			sudo apt-get upgrade && apt-get update
			sudo apt-get install python3
			sudo apt-get install php
			sudo apt-get install python
			sudo pip3 install requests
			sudo pip3 install smtp
			sleep 1
			echo -n "${BLUE}[${GREEN}+${BLUE}] ${GREEN}Succesful Installed..!"
                	echo ""
		fi
	fi	
fi

