# Dotfiles

Storage for dotfiles, configs, etc.

Ideally helps me bootstrap new machines and installs quicker.

## Install

### Emacs

```
ln -s ~/code/personal/dotfiles/emacs/config.el ~/.doom.d/
ln -s ~/code/personal/dotfiles/emacs/init.el ~/.doom.d/
ln -s ~/code/personal/dotfiles/emacs/packages.el ~/.doom.d/
```

### OpenCode

```sh
ln -s ~/code/personal/dotfiles/ai/AGENTS.md ~/.config/opencode/AGENTS.md
```

The global OpenCode configuration must include `~/.config/opencode/AGENTS.md` in its `instructions` array.

### Git

Create `~/.gitconfig-work`

```
ln -s ~/code/personal/dotfiles/git/.gitconfig ~/
ln -s ~/code/personal/dotfiles/git/.gitconfig-personal ~/
ln -s ~/code/personal/dotfiles/git/.gitignore_global ~/
ln -s ~/code/personal/dotfiles/git/.gitattributes ~/
```

### Raycast

Settings -> Advanced -> Import / Export

### Vim

ln -s ~/code/personal/dotfiles/vim/init.lua ~/.config/nvim/init.lua

### Zsh

ln -s ~/code/personal/dotfiles/zsh/.zshrc ~/
