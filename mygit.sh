#!/bin/bash

#THIS DOES NOT WORK!!!!!1

echo "mygit.sh -a action -u username -t token"

while getopts ":a:u:t:" opt; do
  case $opt in
    a) action="$OPTARG"
    ;;
    u) username="$OPTARG"
    ;;
    t) token="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&3
    ;;
  esac
done

echo $token
echo "Running git $action origin master $username $token"

git $action origin master <<END 
$username 
$token
END
