# Add 'git lg' alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Add Vundle to vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# My config files configuration
git clone https://github.com/kajstof/dotfiles ~/dotfiles
rm -rf ~/.vimrc ~/.Xresources ~/.config/fontconfig ~/.config/i3 ~/.config/rofi ~/.config/termite ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.config/fontconfig ~/.config/fontconfig
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/rofi ~/.config/rofi
ln -s ~/dotfiles/.config/termite ~/.config/termite
ln -s ~/dotfiles/.zshrc ~/.zshrc

# Vim plugins installation
vim +PluginInstall +qall

# Set zsh as default shell
sudo chsh -s /bin/zsh root

# Add user to docker group. Added user can run docker command without sudo command
sudo gpasswd -a "${USER}" docker
sudo reboot
# docker run hello-world
