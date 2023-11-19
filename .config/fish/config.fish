set -l time (date)
set -l user $USER

set -g fish_greeting
set -x XDG_CONFIG_HOME $HOME/.config
set -x TMUX_PLUGIN_MANAGER_PATH ~/.tmux/plugins

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if status is-interactive
    echo -e "\e[38;5;69m$time"
    echo -e "\e[38;5;141m$user\e[38;5;110m@\e[38;5;141m$hostname"
end
