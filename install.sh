# Create ~/Tools dir
mkdir -p ~/Tools

# Apps installation
sudo apt install -y build-essential linux-headers-generic ssh xclip zsh
sudo apt install -y python nodejs
sudo apt install -y i3 i3blocks i3lock-fancy i3status rofi
# sudo apt install -y fonts-inconsolata
sudo apt install -y fonts-powerline ttf-mscorefonts-installer
# sudo apt install -y lxappearance    # Then set a font to Ubuntu Light 8
sudo apt install -y git tig vim taskwarrior ripgrep

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
sudo apt update -y
sudo apt install -y docker-ce