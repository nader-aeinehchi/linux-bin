#!/bin/bash

echo "gsshr.sh -a address -u username@google.com"

#nader_skatt_gmail_com
#35.228.191.76
#5901

while getopts ":a:u:" opt; do
  case $opt in
    a) address="$OPTARG"
    ;;
    u) user="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

echo "ssh -X -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no -i $HOME/.ssh/google_compute_engine -A -p 22 $user@$address"

ssh -X -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no -i $HOME/.ssh/google_compute_engine -A -p 22 $user@$address


