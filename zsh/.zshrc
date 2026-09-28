export EDITOR="nvim"

. ~/.zsh_work

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

# Eza
alias ls="eza --group-directories-first"
alias l="eza -l --no-user --no-permissions --group-directories-first"
alias ll="eza -l"
alias la="eza -la --group-directories-first"
alias lt="eza --tree -L 1 --group-directories-first"
alias lta="eza --tree -L 1 -a --group-directories-first"

# Git
alias g="git"
alias ga="git add"
alias gb="git branch --sort=-committerdate -v"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcom="git checkout main"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gl="git log"
alias gs="git status"
alias gp="git pull"
alias gpu="git push"
alias gc="git commit -v"
alias gc!="gc --amend"
alias gcf="git commit --fixup"
alias gcm="git commit -m"
alias gnvm="git reset --soft HEAD~1"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grbm="git rebase main"
alias gm="git merge"
alias grs="git restore"
alias grst="git restore --staged"
alias grsm="git restore --source=main"
alias gwt="git worktree"

grbmb () {
        git rebase -i $(git merge-base @ main)
}
gcfl () {
        gc --fixup $(git rev-parse HEAD)
}
_gwt_main_root() {
  local common_git
  common_git="$(git rev-parse --path-format=absolute --git-common-dir)" || return
  printf '%s\n' "${common_git%/.git}"
}
_gwt_base_dir() {
  local main_root repo parent
  main_root="$(_gwt_main_root)" || return
  repo="$(basename "$main_root")"
  parent="$(dirname "$main_root")"
  printf '%s\n' "$parent/worktrees/$repo"
}
_gwt_target_dir() {
  local folder="$1"
  local flat_folder="${folder//\//-}"
  printf '%s\n' "$(_gwt_base_dir)/$flat_folder"
}
gwta() {
  if [ $# -lt 1 ]; then
    printf 'usage: gwta <folder-name> [branch-name] [base-branch]\n'
    return 2
  fi
  local folder="$1"
  local branch="${2:-$folder}"
  local base="${3:-main}"
  local target="$(_gwt_target_dir "$folder")"
  mkdir -p "$(dirname "$target")"
  if git show-ref --verify --quiet "refs/heads/$branch"; then
    git worktree add "$target" "$branch"
  else
    git worktree add -b "$branch" "$target" "$base"
  fi
  cd "$target"
}
gwtr() {
  if [ $# -lt 1 ]; then
    printf 'usage: gwtr <folder-name>\n'
    return 2
  fi
  local folder="$1"
  local main_root="$(_gwt_main_root)"
  local target="$(_gwt_target_dir "$folder")"
  local target_real
  target_real="$(cd "$target" 2>/dev/null && pwd -P)"
  if [ -n "$target_real" ]; then
    case "$(pwd -P)/" in
      "$target_real"/*)
        cd "$main_root"
        ;;
    esac
  fi
  git worktree remove "$target"
}
gwti() {
  local main_root
  main_root="$(_gwt_main_root)" || return
  if [ -f "$main_root/.env" ]; then
    cp "$main_root/.env" ./.env
    printf 'Copied .env from %s\n' "$main_root"
  else
    printf 'Warning: no .env found in %s\n' "$main_root"
  fi

  if [ -f "bun.lockb" ] || [ -f "bun.lock" ]; then
    bun install
  elif [ -f "pnpm-lock.yaml" ]; then
    pnpm i
  elif [ -f "yarn.lock" ]; then
    yarn
  elif [ -f "package-lock.json" ]; then
    npm i
  elif [ -f "package.json" ]; then
    npm i
  else
    printf 'Warning: no package manager lockfile found\n'
  fi
}
gwtl() {
  git worktree list --porcelain |
  while IFS= read -r line; do
    case "$line" in
      "worktree "*)
        worktree=${line#worktree }
        branch=$(git -C "$worktree" symbolic-ref --quiet --short HEAD) || branch=""
        last_commit=$(git -C "$worktree" log -1 --format='%ci  %h  %s')
  
        if [ -z "$branch" ]; then
          label="detached HEAD"
        elif git -C "$worktree" show-ref --verify --quiet "refs/remotes/origin/$branch"; then
          label="$branch"
        else
          label="origin missing"
        fi
  
        printf '%s [%s]\n  last: %s\n\n' "$worktree" "$label" "$last_commit"
        ;;
    esac
  done
}

# Zsh
alias zshrc="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

## Misc

take () {
        mkdir -p $@ && cd ${@:$#}
}

cde () {
        for d in ./*/ ; do (cd "$d" && $@); done
}

# ---

# History
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH case-insensitive autocomplete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# FZF
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Vista Config (vconfig)
export PATH="$HOME/.vista/vconfig/bin:$PATH"
