#!/bin/bash

echo "gsshl.sh -p port -a address -u username@google.com"

#nader_skatt_gmail_com
#35.228.191.76
#5901

while getopts ":a:p:u:" opt; do
  case $opt in
    a) address="$OPTARG"
    ;;
    p) port="$OPTARG"
    ;;
    u) user="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&3
    ;;
  esac
done

printf "user:" $u "address:" $a "port:" $p

echo "Running ssh -L $port:127.0.0.1:$port -C -N -l $user $address "

ssh -L $port:127.0.0.1:$port -C -N -l $user $address
