# dotfiles

My config files

## Configure GitHub SSH key

```bash
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
```

## Basic setup

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/kajstof/dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.config/fontconfig ~/.config/fontconfig
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/rofi ~/.config/rofi
ln -s ~/dotfiles/.config/termite ~/.config/termite
```

## Vim Plugin installation

Open Vim and run `:PluginInstall`

Or install from command line: `vim +PluginInstall +qall`

Fonts installation: `sudo apt-get install fonts-powerline`

Set ZSH as default shell: `chsh -s /bin/zsh root`

## Apps to install

- Boostnote
- Visual Studio Code
- Chrome
