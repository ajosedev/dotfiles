#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andrew/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/andrew/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andrew/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/andrew/google-cloud-sdk/completion.zsh.inc'; fi

alias j="fasd_cd"
