# Dotfiles

Storage for dotfiles, configs, etc.

Ideally helps me bootstrap new machines and installs quicker.

## TODO:

- Install script for placing/symlinking dotfile
- Zsh theme

## Install

### Git

Create `~/.gitconfig-work`

```
ln -s ~/code/personal/dotfiles/git/.gitconfig ~/
ln -s ~/code/personal/dotfiles/git/.gitconfig-personal ~/
ln -s ~/code/personal/dotfiles/git/.gitignore ~/
ln -s ~/code/personal/dotfiles/git/githooks ~/
```

### iTerm2

Settings -> General -> Preferences -> Load preferences from a custom folder or URL...

### Tmux

`ln -s ~/code/personal/dotfiles/tmux/.tmux.conf ~/`

### VSCode

`ln -s ~/code/personal/dotfiles/VSCode/* ~/Library/Application\ Support/Code/User`

### Vim

`ln -s ~/code/personal/dotfiles/vim/.vimrc ~/`

### Zsh

`ln -s ~/code/personal/dotfiles/zsh/.zshrc ~/`
