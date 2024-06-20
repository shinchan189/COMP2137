#!/bin/bash

USERNAME=$USER                      #   Get the username through USER command
today=$(date +"%Y-%m-%d %H:%M:%S")                   #   Use the date command to get today's date


#SYSTEM  INFORMATION

HOSTNAME=$(hostname  )              #   Get the hostname by hostname command
OS=$(hostnamectl   |   grep 'Operating System')                  #    hostnamectl is used for the operating system
UPTIME=$(uptime -p)                  #    got the uptime  thorugh uptime command



#HARDWARE INFORMATION

CPU=$(lscpu |  grep 'Model name:')         #    Used lscpu command to get the cpu information specially model name
speed=$(lscpu  |  grep 'CPU MHz' )         #    lscpu to get the spedd in MHz
RAM=$(free -h  |  awk '/Mem:/ {print $2}')             #    To get the RAM used free command
DISK=$(lsblk )                            #    lsblk for gain DISKS 




#NETWORK INFORMATION

HOST_ADDRESS=$(hostname -I    |   awk '{print $1}')               #    Hostname  -I for the host address
Gateway_IP=$(ip r | awk '{print $3}')      #    ip r for the gateway_ip

IP_ADDRESS=$(hostname -I |   awk '{print $1}')                 #    Hostname  -I for the IP address




#SYSTEM STATUS

USER_LOGGED_IN=$(who)                      #    get the user logged name by who command
DISK_SPACE=$(df -h)                        #    df-h for the disk space







# Output report

cat <<EOF

System Report generated by $USERNAME, $today

System Information
____________________
Hostname: $HOSTNAME
OS: $OS
Uptime: $UPTIME


HARDWARE_INFORMATION
____________________
CPU: $CPU
speed:$speed MHz 
RAM:$RAM
DISK:$DISK


NETWORK INFORMATION
____________________
HOST_ADDRESS:$HOST_ADDRESS
Gateway_IP:$Gateway_IP

IP_ADDRESS:$IP_ADDRESS


SYSTEM STATUS
__________________
USER_LOGGED_IN:$USER_LOGGED_IN
DISK_SPACE:$DISK_SPACE




EOF

