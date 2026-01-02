#!/bin/bash
sa(){
  # Use systemd user ssh-agent service (one agent per user)
  if [ -z "$SSH_AUTH_SOCK" ] || [ ! -S "$SSH_AUTH_SOCK" ]; then
    # Set SSH_AUTH_SOCK to systemd socket if available
    if [ -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]; then
      export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
    else
      # Ensure systemd service is running
      systemctl --user start ssh-agent.service 2>/dev/null
      # Wait a moment for socket to appear
      sleep 0.5
      if [ -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]; then
        export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
      else
        echo "Error: Could not connect to SSH agent. Is systemd user service enabled?"
        return 1
      fi
    fi
  fi
  
  # Add keys if not already added
  ssh-add /home/r/.ssh/id_ed25519 2>/dev/null || true
  ssh-add /home/r/.ssh/new-github 2>/dev/null || true
  ssh-add -l
}

fs() {
  local dir
  if [ $# -eq "0" ] ; then
    dir=$(cat /home/r/.ssh/config  | grep '^Host ' | cut -d' ' -f2 | fzf +m --header="Переход к серверу")  && ssh "$dir"
  else
    dir=$(cat /home/r/.ssh/config  | grep '^host ' | grep "$1" | cut -d' ' -f2 | fzf +m --header="Переход к серверу") && set_xterm_title "xterm SSH to $dir" && ssh "$dir"; set_xterm_title "xterm"
  fi
}


work() {
	local dir
	dir=$(ls /home/r/common/work | fzf +m) && cd /home/r/common/work/"$dir"

	if [ -f .nvmrc ]; then
		use-nvm
		echo "Switching node: "
		cat .nvmrc
		nvm use;
	
	fi
}

learn() {
	local dir
	dir=$(ls /home/r/common/learn | fzf +m) && cd /home/r/common/learn/"$dir"
}

itmo() {
	local dir
	dir=$(ls /home/r/common/itmo | fzf +m) && cd /home/r/common/itmo/"$dir"
}

speeches() {
	local dir
	dir=$(ls /home/r/common/speeches | fzf +m) && cd /home/r/common/speeches/"$dir"
}

function cd_() {
  mkdir $1
  cd $1
}


setNpmMirror() {
  local registries=(
    'https://registry.npmjs.org/'
    'https://nexus.vzhyx.digital/repository/npm-all/'
  )

  local current

  current=$(printf "%s\n" "${registries[@]}" | fzf +m) &&
  sed --in-place '/registry/d' /home/r/.npmrc &&
  sed --in-place '/registry/d' /home/r/.yarnrc &&
  echo registry="$current" >> /home/r/.npmrc &&
  echo registry="$current" >> /home/r/.yarnrc
}

code() {
    nohup cursor.AppImage "$@" >/dev/null 2>&1 < /dev/null & 
    disown
}
