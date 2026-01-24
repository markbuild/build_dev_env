#!/bin/bash

# start ~/k.ahk # windows 下的AutoHotKey

rm -rf ~/.vim/swap/*

tmux new-session -s tmuxSession -n fast -d
# :mksession! ~/.vim/session_fast.vim
tmux send-keys -t tmuxSession 'export vimSessionName=fast' C-m
if [ -f ~/.vim/session_fast.vim ]; then
  tmux send-keys -t tmuxSession 'vim -S ~/.vim/session_fast.vim' C-m
else
  tmux send-keys -t tmuxSession 'vim ~/code/markbuild/h/fast' C-m
fi

tmux new-window -n fileExplore -c ~/

tmux new-window -n api -c ~/code/markbuild/api
tmux send-keys -t tmuxSession 'vim ~/code/markbuild/api/README.txt' C-m
tmux split-window -h -c ~/code/markbuild/api
#tmux send-keys -t tmuxSession 'npm run serve' C-m
tmux split-window -v -c ~/code/markbuild/api
tmux send-keys -t tmuxSession 'gs && cls' C-m

tmux attach -t tmuxSession

#tmux kill-session -t tmuxSession
