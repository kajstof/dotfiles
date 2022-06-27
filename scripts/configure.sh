#!/usr/bin/env bash

# Add 'git lg' alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Add vim-plug to Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# My config files configuration
git clone https://github.com/kajstof/dotfiles ~/dotfiles
rm -rf ~/.profile ~/.zshrc ~/.vimrc ~/.Xresources ~/.config/fontconfig ~/.config/i3 ~/.config/rofi ~/.config/polybar ~/.config/termite
ln -s ~/dotfiles/.profile ~/.profile
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.config/fontconfig ~/.config/fontconfig
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/rofi ~/.config/rofi
ln -s ~/dotfiles/.config/polybar ~/.config/polybar
ln -s ~/dotfiles/.config/termite ~/.config/termite

# Vim plugins installation
vim +PlugInstall +qall

# Set zsh as default shell
sudo chsh -s /bin/zsh root
sudo chsh -s /bin/zsh "$USER"

# Zplug installation
zplug install

# Add user to docker group. Added user can run docker command without sudo command
sudo gpasswd -a "${USER}" docker

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# Reboot system
confirm "Do you want to restart computer? [y/N]" && sudo reboot
