# Dotfiles

Storage for dotfiles, configs, etc.

Ideally helps me bootstrap new machines and installs quicker.

## TODO:

- Install script for placing/symlinking dotfile
- Zsh theme

## Install

### Emacs

```
ln -s ~/code/personal/dotfiles/emacs/config.el ~/.doom.d/
ln -s ~/code/personal/dotfiles/emacs/init.el ~/.doom.d/
ln -s ~/code/personal/dotfiles/emacs/packages.el ~/.doom.d/
```

### Git

Create `~/.gitconfig-work`

```
ln -s ~/code/personal/dotfiles/git/.gitconfig ~/
ln -s ~/code/personal/dotfiles/git/.gitconfig-personal ~/
ln -s ~/code/personal/dotfiles/git/.gitignore_global ~/
ln -s ~/code/personal/dotfiles/git/.gitattributes ~/
```

### iTerm2

Settings -> General -> Preferences -> Load preferences from a custom folder or URL...

### Raycast

Settings -> Advanced -> Import / Export

### Tmux

`ln -s ~/code/personal/dotfiles/tmux/.tmux.conf ~/`

### VSCode

`ln -s ~/code/personal/dotfiles/VSCode/* ~/Library/Application\ Support/Code/User`

### Vim

`ln -s ~/code/personal/dotfiles/vim/.vimrc ~/`

### Zsh

`ln -s ~/code/personal/dotfiles/zsh/.zshrc ~/`
