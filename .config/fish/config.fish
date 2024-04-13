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

bind \co 'prevd'

function rnd_greeting
    random choice (printf '%s is fat.' $USER) \
        (printf 'Used memory: %s/256 TB' (random 0 256)) \
        'Initialising NSA backdoor...' \
        'Segmentation fault (core dumped)' \
        (printf '(%s) cores dedicated to crypto mining.' (random 8 32)) \
        'Leaking IP to North Korea...' \
        'Overclocking GPU...' \
        'rm -rf --no-preserve-root ur mom' \
        'BTC wallet secret: L1aLuuBCodTWaLooekpdNSEbvCrGgyCzRZPt8qbwj3ohMU6S5rzt' \
        'Root Password: password123' \
        (printf 'Ping: %sms' (ping -c 1 google.com | tail -1 | awk '{print $4}' | cut -d '/' -f 1 | cut -d '.' -f 1)) \
        'Breeding genetically modified catgirls...' \
        'Deleting System32...' \
        (printf '%s has approximately %s gay' $USER (random 1 100)) \
        (printf '%s hospitals DDoSed.' (random 10 256))
end

if status is-interactive
    echo -e "\e[38;5;69m$time"
    
    if test (random 0 20) -eq 8
        cat (printf "/home/%s/.config/fish/art%s.txt" $USER (random 0 1))
    else
        echo (set_color brcyan)(rnd_greeting)
    end
end

function fish_prompt -d "Writes out the CLI prompt"
    printf '%s%s%s@%s%s %s%s %s🢖 ' (set_color purple;) $USER (set_color blue) (set_color purple) $hostname (set_color green;) (prompt_pwd) (set_color normal)
end

zoxide init fish --cmd cd | source
