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
ln ~/dotfiles/.vimrc ~/.vimrc -s
ln ~/dotfiles/.Xresources ~/.Xresources -s
```

## Vim Plugin installation

Open Vim and run `:PluginInstall`

Or install from command line: `vim +PluginInstall +qall`



