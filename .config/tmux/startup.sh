#!/usr/bin/env bash
tmux new-session -d -s s

tmux new-window -t s
tmux new-window -t s
tmux new-window -t s
tmux new-window -t s
tmux new-window -t s -n "mouse"
tmux new-window -t s -n "deej"

# run deej and mouse-follows-focus on session start
# (depends on zoxide being aliased as cd)
tmux send-keys -t s:mouse "cd projects mouse-follows-focus && ./run.sh" C-m
tmux send-keys -t s:deej "cd projects deej && ./deej-dev" C-m

tmux select-window -t s:0
tmux attach-session -t s
