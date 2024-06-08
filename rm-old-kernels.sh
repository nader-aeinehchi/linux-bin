#!/bin/bash


echo "Show old kernels....................."
dpkg -l | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r)


#Linux images and headers
echo "All Linux images and headers.............................."
sudo dpkg --list | egrep -i --color 'linux-image|linux-headers'


#Old kernels
echo "Old kernels..................................."
dpkg -l | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r)apt-

echo "Current kernel................................"
#Current kernel
echo "Show kernels automatically installed..............."
apt-mark showauto 'linux-image-.*'

echo "Show kernels manually installed..............."
apt-mark showmanual 'linux-image-.*'

#Run update-grub


echo "Showing the old kernels remaining................"
dpkg -l | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r)


#apt autoremove --purge

#Keep the kernel and not upgrade!
#https://hollysydney.com/article/prevent-ubuntu-upgrading-kernel

#Discover the current latest kernel currently installed. Its the one with the biggest number. $ dpkg -l | grep linux-image
#Become root. $ sudo su
#Pin that package and the generics. $ echo linux-image-2.6.32-38-generic hold | dpkg --set-selections; $ echo linux-image-generic hold | dpkg --set-selections; $ echo linux-generic hold | dpkg --set-selections;
#Update and upgrade apt.
#$ sudo aptitude update;
#$ sudo aptitude safe-upgrade;

