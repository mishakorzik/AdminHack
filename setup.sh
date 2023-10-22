#!/bin/bash

# Define color codes for use in the script
RED="$(printf '\033[31m')"
GREEN="$(printf '\033[32m')"
BLUE="$(printf '\033[34m')"
CYAN="$(printf '\033[36m')"
DEFAULT_FG="$(printf '\033[39m')"

clear

# Display the menu to select an option
echo "${BLUE}------------ ---------"
echo "| ${RED} Select Option ${BLUE}     |"
echo "|------- ----  -------|"
echo "| ${CYAN}1. Termux ${BLUE} "
echo "| ${CYAN}2. Linux ${BLUE} "
echo "| ${CYAN}3. Kali Linux ${BLUE} "
echo "| ${CYAN}4. Arch Linux ${BLUE} "
echo "|                     |"
echo "| ${RED}Enter your choice (1/2/3/4): ${BLUE}"
echo "----  ---------- ------"

# Read the selected option from the user
read numb

clear

# Display the selected option
echo "${BLUE}------------ ---------"
echo "| ${RED} Select Option ${BLUE}     |"
echo "|------- ----  -------|"
echo "| ${CYAN}1. Termux ${BLUE} "
echo "| ${CYAN}2. Linux ${BLUE} "
echo "| ${CYAN}3. Kali Linux ${BLUE} "
echo "| ${CYAN}4. Arch Linux ${BLUE} "
echo "|                     |"
echo "| ${RED}Selected option: ${numb} ${BLUE}"
echo "----  ---------- ------"

# Use conditional statements to install packages based on the selected option
if [ $numb = "1" ]
then
  # Option 1: Install packages for Termux
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
elif [ $numb = "2" ]
then
  # Option 2: Install packages for Linux
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
elif [ $numb = "3" ]
then
  # Option 3: Install packages for Kali Linux
  echo -n "${BLUE}[${RED}!${BLUE}] ${GREEN}Loading Installing In Kali Linux..."
  echo ""
  sudo apt-get upgrade && apt-get update
  sudo apt-get install python3
  sudo apt-get install php
  sudo apt-get install python
  sudo pip3 install requests
  sudo pip3 install smtp
  sleep 1
  echo -n "${BLUE}[${GREEN}+${BLUE}] ${GREEN}Succesful Installed..!"
  echo ""
elif [ $numb = "4" ]
then
  # Option 4: Install packages for Arch Linux
  echo -n "${BLUE}[${RED}!${BLUE}] ${GREEN}Loading Installing In Arch Linux..."
  echo ""
  sudo pacman -Syu
  sudo pacman -S python
  sudo pacman -S python-pip
  sudo pip install requests
  sudo pip install smtp
  sleep 1
  echo -n "${BLUE}[${GREEN}+${BLUE}] ${GREEN}Succesful Installed..!"
  echo ""
else
  # Handle an invalid option
  echo "${RED}Invalid option. Please use (ctrl + c) and run the script again and choose a valid option (1/2/3/4). Or install the dependencies manually for your distro."
  echo "1. Python"
  echo "2. Python-pip"
  echo "3. Requests"
  echo "4. Php"
  echo "5. SMTP"
  echo "6. Toilet"
fi
