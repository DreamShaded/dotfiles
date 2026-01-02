# Go version manager
[[ -s "/home/r/.gvm/scripts/gvm" ]] && source "/home/r/.gvm/scripts/gvm"

# Rust version manager
[[ -s /home/r/.rsvm/rsvm.sh ]] && . /home/r/.rsvm/rsvm.sh # This loads RSVM

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
