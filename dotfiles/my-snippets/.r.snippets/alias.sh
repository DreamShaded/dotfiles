#!/bin/bash
alias ..='cd ..'
alias grep='grep --color=auto'

alias tarnow='tar -acf '
alias untar='tar -zxvf '

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -1 --color=auto --group-directories-first'
alias lst='ls -trl'

alias tarnow='tar -acf '
alias untar='tar -zxvf '

# Ubuntu
# alias setJava='sudo update-alternatives --config java && source ~/.bashrc'
alias setJava='sudo archlinux-java set'

alias deleteAllDockers='docker kill $(docker ps -q) && docker kill $(docker ps -q) && docker rmi $(docker images -q)'

alias pacman-add='sudo pacman -S --needed'
alias pacman-upgrade='sudo pacman -Syu'
alias pacman-remove='sudo pacman -Rns'

alias showLastGitTag='git describe --tags --abbrev=0'

alias findDir='sudo find / -type d -name'
alias reloadWaybar='pkill waybar && waybar'

alias monikFullHD='xrandr --output eDP-2 --mode 1920x1080'
alias kvmMonikRight='xrandr --output HDMI-1-0 --mode 1920x1080 --right-of eDP-2 --output DP-1-0 --mode 1920x1080 --right-of HDMI-1-0'
