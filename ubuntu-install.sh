wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt update
sudo apt install google-chrome-stable

sudo apt-get install gnome-tweaks

#sudo apt-get install xrdp
#sudo adduser xrdp ssl-cert
#sudo systemctl restart xrdp

#sudo apt-get install openssh-server

scp nader@alpha://home/nader/Downloads/linux/gnome/* .
mkdir ~/.local/share/gnome-shell
mkdir ~/.local/share/gnome-shell/extensions

cp putWindow@clemens.lab21.org.zip ~/.local/share/gnome-shell/extensions/


