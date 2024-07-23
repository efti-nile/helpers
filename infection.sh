#!/bin/bash

# Use:
#     wget https://github.com/efti-nile/helpers/raw/main/infection.sh && chmod +x infection.sh && source infection.sh
#
# Environment Variables:
#   - NEW_USER: name for the new user (default: ft)
#   - INSTALL_DOCKER: if set, Docker will be installed
#   - INSTALL_XFCE:   if set, Xfce will be installed
#   - INSTALL_VNC:    if set, a VNC server will be installed and set up

download_configs() {
    cd ~
    wget -O .zshrc https://github.com/efti-nile/helpers/raw/main/.zshrc
    wget -O .vimrc https://github.com/efti-nile/helpers/raw/main/.vimrc
    wget -O aliases.sh https://github.com/efti-nile/helpers/raw/main/aliases.sh
    wget -O .tmux.conf https://github.com/efti-nile/helpers/raw/main/.tmux.conf
}

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root!"
    exit 1
fi

if [ ! "$(grep -E '^ID=(ubuntu|debian)' /etc/os-release)" ]; then
    echo "This is neither Debian nor Ubuntu!"
    exit 2
fi

apt update && apt upgrade

# Install system utilities
apt -y install \
    tree       \
    tmux       \
    vim        \
    git        \
    snapd      \
    wget       \
    sudo       \
    htop       \
    curl       \
    zsh        \
    netstat

# Download CLI configs for root
download_configs
    
# Add a non-root user
NEW_USER=${NEW_USER:-ft}
adduser $NEW_USER
usermod -aG sudo $NEW_USER

# Set up a new ED25519 key
sudo -u $NEW_USER ssh-keygen -t ed25519 -f /home/$NEW_USER/.ssh/id_ed25519 -N ""
sudo -u $NEW_USER touch /home/$NEW_USER/.ssh/authorized_keys
sudo -u $NEW_USER cat /home/$NEW_USER/.ssh/id_ed25519.pub >> /home/$NEW_USER/.ssh/authorized_keys
chmod 600 /home/$NEW_USER/.ssh/authorized_keys
chmod 700 /home/$NEW_USER/.ssh
usermod -aG sudo $NEW_USER

# Install docker
if [ -z ${INSTALL_DOCKER+x} ]; then
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

    # Add the NEW_USER to the docker group
    usermod -aG docker $NEW_USER  

    # Enable Docker's services
    systemctl enable docker.service
    systemctl enable containerd.service
fi

# Install Desktop Environment
if [ -z ${INSTALL_XFCE+x} ]; then
    apt -y install \
        xfce4      \
        xfce4-goodies \
        firefox \
        language-pack-ru
fi

su $NEW_USER

# Download CLI configs for NEW_USER
download_configs

# Setting up VNC (under NEW_USER)
if [ -z ${INSTALL_VNC+x} ]; then
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
fi

# Change default interpretator to Zsh (under NEW_USER)
sudo chsh -s "$(which zsh)" "$USER"
