export EDITOR="nvim"

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
alias ga="git add"
alias gb="git branch --sort=-committerdate -v"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcom="git checkout main"
alias gd="git diff"
alias gds="git diff --staged"
alias gs="git status"
alias gp="git pull"
alias gpu="git push"
alias gc="git commit -v"
alias gc!="gc --amend"
alias gcf="git commit --fixup"
alias gcm="git commit -m"
alias grbm="git rebase main"
alias gnvm="git reset --soft HEAD~1"
alias grsm="git restore --source=main"
alias gwt="git worktree"
alias gwta='git worktree add ../worktrees/"$1" "$2"'
alias gwtl="git worktree list"

grbmb () {
        git rebase -i $(git merge-base @ main)
}

gcfl () {
        gc --fixup $(git rev-parse HEAD)
}

# Zsh
alias zshrc="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"

# Misc
#alias "-"="cd -"
#alias ".."="cd .."
#alias "..."="cd ..."
alias l="ls -lah"

take () {
        mkdir -p $@ && cd ${@:$#}
}

cde () {
        for d in ./*/ ; do (cd "$d" && $@); done
}

# ---

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Vista Config (vconfig)
export PATH="$HOME/.vista/vconfig/bin:$PATH"
