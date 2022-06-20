export ZSH="/Users/andrewjose/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  autojump
  git
  alias-finder
  alias-tips
  fzf
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting # must be last
)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

# Work config
. ~/.zsh_99d

alias personal="cd ~/code/personal"
alias business="cd ~/code/99designs"

# Path
export GOPATH=$HOME/go
path+=$GOPATH/bin
path+=~/.emacs.d/bin
path+=/opt/homebrew/opt/go@1.16/bin

# Vim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Rg
alias rg="rg -pS"

# Bat
alias cat="bat -p"

# Fzf
alias fzfp="fzf --preview 'bat --color=always {}'"

# Git
alias g="git"
alias gb="git branch --sort=committerdate"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcom="git checkout master"
alias gd="git diff"
alias gds="git diff --staged"
alias gs="git status"
alias gp="git pull"
alias gpu="git push"
alias gc="git commit -v"
alias gc!="gc --amend"
alias gcf="git commit --fixup"
alias gcm="git commit -m"
alias grbm="git rebase master"
alias gnvm="git reset --soft HEAD~1"

grbmb () {
	git rebase -i $(git merge-base @ master)
}

gcfl () {
	gc --fixup $(git rev-parse HEAD)
}

# Zsh
alias zshrc="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"

# One for recursive git status -sb
# Misc
# alias "-"="cd -"
alias l="ls -lah"

# Less
alias less="less -R"

take () {
	mkdir -p $@ && cd ${@:$#}
}

cde () {
	for d in ./*/ ; do (cd "$d" && $@); done
}

nw () {
	tmux new-window -c $(j $@) && tmux rename-window $@
}


# fzf
export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_compgen_path() {
  fd --follow . "$1"
}
_fzf_compgen_dir() {
  fd --type d --follow . "$1"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

