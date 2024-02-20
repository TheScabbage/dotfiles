set -l time (date)
set -l user $USER

set -g fish_greeting
set -x XDG_CONFIG_HOME $HOME/.config
set -x TMUX_PLUGIN_MANAGER_PATH ~/.tmux/plugins
set -x DOTNET_ROOT $HOME/.dotnet

set -gx fish_cursor_default line blink
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore


if status is-interactive
    echo -e "\e[38;5;69m$time"
    echo -e "\e[38;5;141m$user\e[38;5;110m@\e[38;5;141m$hostname"
end

zoxide init fish --cmd cd | source
