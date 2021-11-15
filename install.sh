#!/bin/bash

ln -s ~/code/personal/dotfiles/emacs/config.el ~/.doom.d/
ln -s ~/code/personal/dotfiles/emacs/init.el ~/.doom.d/
ln -s ~/code/personal/dotfiles/emacs/packages.el ~/.doom.d/

ln -s ~/code/personal/dotfiles/git/.gitconfig ~/
ln -s ~/code/personal/dotfiles/git/.gitconfig-personal ~/
ln -s ~/code/personal/dotfiles/git/.gitignore_global ~/
ln -s ~/code/personal/dotfiles/git/.gitattributes ~/

ln -s ~/code/personal/dotfiles/tmux/.tmux.conf ~/

ln -s ~/code/personal/dotfiles/VSCode/* ~/Library/Application\ Support/Code/User

ln -s ~/code/personal/dotfiles/vim/.vimrc ~/

ln -s ~/code/personal/dotfiles/zsh/.zshrc ~/
