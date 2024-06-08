#!/bin/bash

read -p "Do you want to delete all the project settings? (yes/no)" reply

choice=$(echo $reply|sed 's/(.*)/L1/')

if [ "$choice" = 'yes' ] 
then
	rm -rf project;
	rm -rf target;
	rm -rf .bloop;
	rm -rf .bsp;
	rm -rf .metals;
	rm -rf .vscode;
elif [ "$choice" = 'no'  ]
then
  echo "You selected 'no', hence exiting in 3 seconds";
  sleep 3
  exit 0
else
echo "invalid answer, type yes or no";
fi
