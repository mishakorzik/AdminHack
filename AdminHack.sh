#!/bin/bash

# Colors and styles
r='\e[91m'
g='\e[92m'
y='\e[93m'
b='\e[94m'
p='\e[95m'
c='\e[96m'
w='\e[97m'
n='\e[0m'

bd='\e[1m'
dm='\e[2m'
it='\e[3m'
ul='\e[4m'
rv='\e[7m'

thread=15
count=1

# Exit trap to kill any remaining curl processes
exits() {
    checkphp=$(ps aux | grep -o "curl" | head -n1)
    if [[ $checkphp == *'curl'* ]]; then
        pkill -f -2 curl > /dev/null 2>&1
        killall -2 curl > /dev/null 2>&1
    fi
}
trap 'printf "\n";exits;exit 0' INT

# Banner function
banner() {
        rand1=$( shuf -i 0-${#colors[@]} -n 1 )
        rand2=$( shuf -i 0-${#colors[@]} -n 1 )
        sss=''
        start=1
        end=50
        for (( mo=${start}; mo <= ${end}; mo++)); do
                if [[ $mo == ${start} ]]; then
                        sss+="${bd}${w}+"
                elif [[ $mo == $end ]]; then
                        sss+="${bd}${w}+"
                elif [[ $mo == $(( (end / 2 ) + 1)) ]]; then
                        sss+="${bd}${g}+"
                elif [[ $mo > 1 ]]; then
                        sss+="${bd}${r}-"
                fi
        done
echo -e "\t${colors[rand1]}  _______  ______   __   __  ___  __    _   __   __  _______  _______  ___   _"
echo -e "\t${colors[rand1]} |   _   ||      | |  |_|  ||   ||  |  | | |  | |  ||   _   ||       ||   | | |"
echo -e "\t${colors[rand1]} |  |_|  ||  _    ||       ||   ||   |_| | |  |_|  ||  |_|  ||       ||   |_| |"
echo -e "\t${colors[rand1]} |       || | |   ||       ||   ||       | |       ||       ||       ||      _|"
echo -e "\t${colors[rand1]} |       || |_|   ||       ||   ||  _    | |       ||       ||      _||     |_"
echo -e "\t${colors[rand1]} |   _   ||       || ||_|| ||   || | |   | |   _   ||   _   ||     |_ |    _  |"
echo -e "\t${colors[rand1]} |__| |__||______| |_|   |_||___||_|  |__| |__| |__||__| |__||_______||___| |_|"
        echo -e "                 \t${bd}${g}╭${w} Author  ${b}:${c} ${ul}Mishakorzhik${n}          ${g}${n}"
        echo -e "                 \t${bd}${g}│${w} Version ${b}:${w} 1.8.2                          ${g}${n}"
        echo -e "                 \t${bd}${g}│${w} Code    ${b}:${w} Bash, python                   ${g}${n}"
        echo -e "     \t${bd}${g} ╭──────────────┴${w} Date    ${b}:${w} 16 05 2021                 ${g}${n}"
}

# Function to check and print the content of robots.txt
check_robots() {
    local site=$1
    response=$(curl -s -L "${site}/robots.txt")
    http_code=$(curl -s -o /dev/null -w "%{http_code}" -L "${site}/robots.txt")
    if [[ $http_code == "200" && ! -z "$response" && ! "$response" == *"</html>"* ]]; then
        echo -e "      \t${g}[${w}+${g}]${w} Robots.txt found for ${site}${n}"
        if [[ ! -z $output_file ]]; then
            #echo -e "      \t${g}[${w}+${g}]${w} Saving Robots.txt for ${site}${n}"
            wget -q -O "${web}/robots.txt" "${site}/robots.txt"
        fi
    else
        echo -e "      \t${g}[${r}-${g}]${w} No Robots.txt found for ${site}${n}"
        echo ""
    fi
}

# Function to perform brute force
scan() {
    web=${1}
    path="${2}"
    scan_web=$( curl -s -o /dev/null ${web}/${path} -w %{http_code} )
    if [[ $scan_web == 200 ]] || [[ $scan_web == 201 ]]; then
        printf "\n"
        echo -e "      \t${g}[${w}+${g}] ${w}${web}/${path} ${y}~> ${g}${scan_web}${n}"
        if [[ ! -z $output_file ]]; then
            echo "${web}/${path} ~> ${scan_web}" >> $output_file
        fi
        printf "\n"
    else
        echo -e "      \t${g}[${r}-${g}] ${w}${web}/${path} ${b}~> ${r}${scan_web}${n}"
        if [[ ! -z $output_file ]]; then
            echo "${web}/${path} ~> ${scan_web}" >> $output_file
        fi
    fi
}

# Start of the script
python3 src/CheckVersion.py
sleep 1.5


banner
echo -ne "      \t${c}[${w}>${c}] ${w}Enter your website ${g}:${n} "
read web

if [[ -z $web ]]; then
    printf "\n"
    echo -e "${b}[${r}!${b}]${w} Error! Invalid web site !!"
    exit 0
fi

web=$(echo ${web} | cut -d '/' -f 3)


echo -ne "      \t${c}[${w}>${c}] ${w}Enter your wordlist ${g}(${w}Default${g}:${w} wordlist.txt${g}) ${g}:${n} "
read wordlist

echo -ne "      \t${c}[${w}>${c}] ${w}Do you want to save the output? (yes/no) ${g}:${n} "
read save_output

if [[ "$save_output" == "yes" ]]; then
    # Create directory with target website's name
    mkdir -p "${web}"
    output_file="${web}/output.txt"
else
    output_file=""
fi

wordlist=${wordlist:-wordlist.txt}
if ! [[ -e $wordlist ]]; then
    printf "\n"
    echo -e "${b}[${r}!${b}]${w} List not found !!"
    exit 0
fi

echo -ne "      \t${c}[${w}>${c}] ${w}Enter threads count ${g}(${w}Default${g}:${w} 15${g}) ${g}:${n} "
read thrd
thread=${thrd:-${thread}}

printf "\n"
echo -e "      \t${g}[${w}+${g}]${w} Total Wordlist ${g}:${w} $( wc -l $wordlist | cut -d ' ' -f 1 )"

echo -ne "      \t${g}[${w}+${g}]${w} Start Scanning${n}"
for((;T++<=10;)) { printf '.'; sleep 1; }
printf "\n\n"

# Call the check_robots function here
check_robots "http://${web}"
if [[ "$save_output" == "yes" ]]; then
    echo -e "      \t${g}[${w}+${g}]${w} Output will be saved in directory: ${web}"
fi
sleep 3

main() {
    pids=()

    for list in $(< $wordlist); do
        if [[ ${#pids[@]} -ge $thread ]]; then
            wait -n
            pid_to_remove=$?
            for index in "${!pids[@]}"; do
                if [[ "${pids[$index]}" == "$pid_to_remove" ]]; then
                    unset 'pids[$index]'
                    break
                fi
            done
        fi
        scan "http://${web}" "${list}" &
        pids+=($!)
    done

    wait
}

main
