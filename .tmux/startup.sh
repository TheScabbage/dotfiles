#!/usr/bin/env bash
tmux new-session -d -s startup_session

tmux new-window -t startup_session 
tmux new-window -t startup_session 
tmux new-window -t startup_session 
tmux new-window -t startup_session 
tmux new-window -t startup_session -n "mouse"
tmux new-window -t startup_session -n "deej"

# run deej and mouse-follows-focus on session start
# (depends on zoxide being aliased as cd)
tmux send-keys -t startup_session:mouse "cd projects mouse-follows-focus && ./run.sh" C-m
tmux send-keys -t startup_session:deej "cd projects deej && ./deej-dev" C-m

tmux select-window -t startup_session:0
tmux attach-session -t startup_session
