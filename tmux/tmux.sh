#!/bin/bash

start ~/k.ahk # windows 下的AutoHotKey

rm -rf ~/.vim/swap/*

tmux new-session -s mkSession -n fast -d
# :mksession! ~/.vim/session_fast.vim
if [ -f ~/.vim/session_fast.vim ]; then
  tmux send-keys -t mkSession 'vim -S ~/.vim/session_fast.vim' C-m
else
  tmux send-keys -t mkSession 'vim S ~/code/markbuild/h/fast' C-m
fi

tmux new-window -n fileExplore -c ~/

tmux new-window -n markbuild -c ~/code/markbuild/
tmux send-keys -t mkSession 'vim S ~/code/markbuild/' C-m
tmux split-window -h -c ~/code/markbuild/
tmux send-keys -t mkSession 'npm run serve' C-m
tmux split-window -v -c ~/code/markbuild/
tmux send-keys -t mkSession 'gs && cls' C-m

tmux attach -t mkSession

#tmux kill-session -t mkSession
