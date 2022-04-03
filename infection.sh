#!/bin/bash

# wget https://github.com/efti-nile/helpers/raw/main/infection.sh && chmod +x infection.sh && source infection.sh

apt update && apt upgrade

adduser ft
usermod -aG sudo ft

apt -y install \
    zsh        \
	tree       \
	tmux       \
	vim        \
	git        \
	snapd
	
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install docker
apt -y install      \
    ca-certificates \
    curl            \
    gnupg           \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt -y install    \
	docker-ce     \
	docker-ce-cli \
	containerd.io 

# Install Desktop Environment
apt -y install
	xfce4
	xfce4-goodies
	firefox

su ft

# Setting up VNC (under ft)
sudo apt -y install tightvncserver
vncserver
# enter vnc password
vncserver -kill :1
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
echo '#!/bin/bash
xrdb '"$HOME"'/.Xresources
startxfce4 &
' > ~/.vnc/xstartup
sudo chmod +x ~/.vnc/xstartup
vncserver

# Download configs (under ft)
cd "$HOME"
wget https://github.com/efti-nile/helpers/raw/main/.zshrc
wget https://github.com/efti-nile/helpers/raw/main/.vimrc
wget https://github.com/efti-nile/helpers/raw/main/aliases.sh
wget https://github.com/efti-nile/helpers/raw/main/.tmux.conf

# Change default interpretator to Zsh (for ft)
sudo chsh -s "$(which zsh)" "$USER"

# Install Russian language pack
sudo apt -y install language-pack-ru
