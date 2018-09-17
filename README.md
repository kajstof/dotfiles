# dotfiles

## Windows

1. Clone dotfiles to $HOME directory

```sh
git clone https://github.com/kajstof/dotfiles ~/dotfiles
```

2. Add file `~/.vimrc` with content:

```vim
source ~/dotfiles/.vimrc
```

## Linux Mint on VirtualBox

1. Install Linux Mint (Xfce edition) on VirtualBox
    - Before installation create gpt partition table (e.g via gparted)
    - Without enabled ethernet (an error in newer grub)
    - Optional: Uncheck 'Install third-party software...'
    - HDD recommend: 64 GB (100 MB EFI, 24 GB ext4 /, 40 GB ext4 /home)
2. Make updates & upgrades after installation
    - `sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo aptitude safe-upgrade`
    - `sudo mintupdate-cli upgrade -r -y --install-recommends` - [-r] - refresh apt cache, [-y] - yes
    - Upgrade Linux via Update Manager (Linux kernel)
3. Install VirtualBox guests additions
    - Insert Guests Addition Image CD
    - `sudo /media/$USER/VBox_GAs*/VBoxLinuxAdditions.run`
4. Install drivers for VirtualBox via Driver Manager
5. Install apps

### Quick installation

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/kajstof/dotfiles/master/install.sh)"
```

### Manual installation

```sh
# Create ~/Tools dir
mkdir -p ~/Tools

# Apps installation
sudo apt install -y build-essential linux-headers-generic ssh xclip zsh
sudo apt install -y python nodejs
sudo apt install -y i3 i3blocks i3lock-fancy i3status rofi
# sudo apt install -y fonts-inconsolata
sudo apt install -y fonts-powerline ttf-mscorefonts-installer
# sudo apt install -y lxappearance    # Then set a font to Ubuntu Light 8
sudo apt install -y git tig vim taskwarrior

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
sudo apt update
sudo apt install -y docker-ce

# Python PIP
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python get-pip.py
sudo apt install -y python3-pip

# AWS CLI
pip install awscli --upgrade --user

# GCP CLI
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
```

6. Configure environment

### Quick configuration

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/kajstof/dotfiles/master/configure.sh)"
```

### Manual configuration

```sh
# Add 'git lg' alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Add Vundle to vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# My config files configuration
git clone https://github.com/kajstof/dotfiles ~/dotfiles
rm -rf ~/.profile ~/.zshrc ~/.vimrc ~/.Xresources ~/.config/fontconfig ~/.config/i3 ~/.config/rofi ~/.config/termite
ln -s ~/dotfiles/.profile ~/.profile
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.config/fontconfig ~/.config/fontconfig
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/rofi ~/.config/rofi
ln -s ~/dotfiles/.config/termite ~/.config/termite

# Vim plugins installation
vim +PluginInstall +qall

# Set zsh as default shell
sudo chsh -s /bin/zsh root

# Add user to docker group. Added user can run docker command without sudo command
sudo gpasswd -a "${USER}" docker

read -r -p "Do you want to restart computer? [y/n] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]
then
    sudo reboot
fi
```

## Useful stuff

### Commands

```sh
xset r rate 180 50
xdpyinfo | grep resolution
xrandr --output Virtual1 --mode 1920x1080
alias ll='ls -lah'
alias ls='ls -F --color=auto --show-control-chars'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

### GitHub SSH key configuration

```sh
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
```

### Vim Plugin installation

- Open Vim and run `:PluginInstall`
- Or install from command line: `vim +PluginInstall +qall`

## Environment for work

- oh my zsh + zplug + spaceship

### Apps list

- Boostnote
- Visual Studio Code
- Chrome
- DotNet Core
- Python
- NodeJS
