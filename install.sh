# Create ~/Tools dir
mkdir -p ~/Tools

# Apps installation
sudo apt install -y build-essential linux-headers-generic ssh xclip zsh feh
sudo apt install -y python python3 python-pip python3-pip nodejs npm
sudo apt install -y i3 i3blocks i3lock-fancy i3status rofi
sudo apt install -y fonts-powerline ttf-mscorefonts-installer
sudo apt install -y feh git tig tmux vim vim-gtk taskwarrior
sudo apt install -y lxappearance                # Then set a font to Ubuntu Regular 9
# sudo apt install -y fonts-inconsolata

# Google Chrome
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
cd ~

# Termite
cd ~/Tools
sudo apt install -y libtool
curl https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh > termite_install.sh
chmod +x termite_install.sh
./termite_install.sh

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# DotNet Core
cd ~/Tools
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.1
rm packages-microsoft-prod.deb
cd ~

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y code # or code-insiders

# Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
export LSB_ETC_LSB_RELEASE=/etc/upstream-release/lsb-release
V=$(lsb_release -cs)
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${V} stable"
sudo apt update
sudo apt install -y docker-ce

# AWS CLI
# pip install awscli --upgrade --user
pip3 install awscli --upgrade --user

# GCP CLI
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
cd ~/Tools
wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-217.0.0-linux-x86_64.tar.gz
tar zxvf google-cloud-sdk-217.0.0-linux-x86_64.tar.gz google-cloud-sdk
rm google-cloud-sdk-217.0.0-linux-x86_64.tar.gz
cd ~

# Other tools
pip install setuptools
pip install locust

# Themes

# Paper icon theme
sudo add-apt-repository ppa:snwh/ppa
sudo apt update
sudo apt install paper-icon-theme

# Papirus icon theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme

# Breeze icon theme
sudo apt install breeze-icon-theme

# Breeze cursor theme
sudo apt install breeze-cursor-theme
