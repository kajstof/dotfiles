# Create ~/Tools dir
mkdir -p ~/Tools

# Apps installation
sudo apt install -y build-essential linux-headers-generic ssh xclip zsh feh
sudo apt install -y python python3 python-pip python3-pip nodejs npm
sudo apt install -y i3 i3blocks i3lock-fancy i3status rofi
sudo apt install -y fonts-powerline ttf-mscorefonts-installer
sudo apt install -y feh git tig tmux vim vim-gtk ranger taskwarrior
sudo apt install -y libxcb-ewmh-dev python-xcbgen xcb-proto cmake
sudo apt install -y lxappearance                # Then set a font to Ubuntu Regular 9
# sudo apt install -y fonts-inconsolata

# i3-gaps
cd ~/Tools

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

rm ~/Tools/i3-gaps/ -rf

# Polybar
cd ~/Tools
sudo apt install -y build-essential git cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt install -y unifont libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev 
git clone https://github.com/stark/siji && cd siji
./install.sh -d ~/.fonts
cd ..
rm siji -rf
git clone --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install
cd ~
rm Tools/polybar -rf

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

# Playerctl (media control for i3wm)
cd ~/Tools
wget http://ftp.de.debian.org/debian/pool/main/p/playerctl/libplayerctl-1.0-0_0.6.1-1.1_amd64.deb
wget http://ftp.de.debian.org/debian/pool/main/p/playerctl/playerctl_0.6.1-1.1_amd64.deb
sudo dpkg -i libplayerctl-1.0-0_0.6.1-1.1_amd64.deb playerctl_0.6.1-1.1_amd64.deb
rm libplayerctl-1.0-0_0.6.1-1.1_amd64.deb playerctl_0.6.1-1.1_amd64.deb
cd ~

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

# Dive
cd ~/Tools
wget https://github.com/wagoodman/dive/releases/download/v0.6.0/dive_0.6.0_linux_amd64.deb
sudo apt install ./dive_0.6.0_linux_amd64.deb
rm dive_0.6.0_linux_amd64.deb
cd ~

# AWS CLI
# pip install awscli --upgrade --user
pip3 install awscli --upgrade --user

# GCP CLI
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Other tools
pip install setuptools
pip install locust

# Themes

# Paper icon theme
sudo add-apt-repository -y ppa:snwh/ppa
sudo apt update
sudo apt install -y paper-icon-theme

# Papirus icon theme
sudo add-apt-repository -y ppa:papirus/papirus
sudo apt update
sudo apt install -y papirus-icon-theme

# Breeze icon theme
sudo apt install -y breeze-icon-theme

# Breeze cursor theme
sudo apt install -y breeze-cursor-theme
