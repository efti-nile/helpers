#!/bin/bash

# wget https://github.com/efti-nile/helpers/raw/main/infection.sh && chmod +x infection.sh && source infection.sh

apt update && apt upgrade

adduser ft
usermod -aG sudo ft

apt install zsh \
	tree \
	tmux \
	vim \
	git \
	snapd
	
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io  
	
apt install xfce4 xfce4-goodies
apt install tightvncserver
apt install firefox

su ft

# Setting up VNC
vncserver
# enter vnc password
vncserver -kill :1
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
echo '#!/bin/bash
xrdb '"$HOME"'/.Xresources
startxfce4 &
' > ~/.vnc/xstartup

zsh  # create .zshrc at first start
