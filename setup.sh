clear
sleep 1
echo Installing please wait...
sleep 2
pkg install python2
pkg install python3
pkg install php
sleep 1 
rand1=$( shuf -i 0-${#colors[@]} -n 1 )
rand2=$( shuf -i 0-${#colors[@]} -n 1 )
# Colors
r='\e[91m'
g='\e[92m'
y='\e[93m'
b='\e[94m'
p='\e[95m'
c='\e[96m'
w='\e[97m'
n='\e[0m'
# effect colors
bd='\e[1m'
dm='\e[2m'
it='\e[3m'
ul='\e[4m'
rv='\e[7m'
echo -e "\t${colors[rand1]} ██████╗░░█████╗░███╗░░██╗███████╗
echo -e "\t${colors[rand1]} ██╔══██╗██╔══██╗████╗░██║██╔════╝
echo -e "\t${colors[rand1]} ██║░░██║██║░░██║██╔██╗██║█████╗░░
echo -e "\t${colors[rand1]} ██║░░██║██║░░██║██║╚████║██╔══╝░░
echo -e "\t${colors[rand1]} ██████╔╝╚█████╔╝██║░╚███║███████╗
echo -e "\t${colors[rand1]} ╚═════╝░░╚════╝░╚═╝░░╚══╝╚══════╝
echo -e "\t${colors[rand1]}         Developer: mishakorzhik
echo -e "\t${colors[rand1]}          Update on: 16 05 2021
