#!/bin/bash
tmux new-session -s mkSession -n todo -d "vim ~/code/lab/todolist"
tmux new-window -n fileExplore -c ~/

tmux new-window -n markbuild -c ~/code/markbuild/ "vim README.md"
tmux split-window -h -c ~/code/markbuild/api
tmux send-keys -t mkSession 'git status' C-m

tmux attach -t mkSession

#tmux kill-session -t mkSession
rm -rf ~/.vim/swap/*
