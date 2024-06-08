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

echo "Running ssh -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no -i $HOME/.ssh/google_compute_engine -A -p 22 -L $port:127.0.0.1:$port -C -N -l $user $address"

ssh -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no -i $HOME/.ssh/google_compute_engine -A -p 22 -L $port:127.0.0.1:$port -N -C -l $user $address





