#!/bin/bash                                                                                                                             
tmux start-server
tmux new-session -d -s leap-dev -n vim-1
tmux new-window -t leap-dev:2 -n vim-2
tmux new-window -t leap-dev:3 -n docker-1
tmux new-window -t leap-dev:4 -n docker-2
tmux new-window -t leap-dev:5 -n rclone-1
tmux new-window -t leap-dev:6 -n file-system-1
tmux new-window -t leap-dev:7 -n file-system-2
tmux new-window -t leap-dev:8 -n git

# C-m to send Enter key
tmux send-keys -t leap-dev:1 "cd /opt/ff" C-m
tmux send-keys -t leap-dev:2 "cd /opt/ff" C-m
tmux send-keys -t leap-dev:3 "cd /opt/ff" C-m
tmux send-keys -t leap-dev:3 "./docker_wrap.py run --http 4304 --container_memory_limit 10g" C-m
tmux send-keys -t leap-dev:3 "./docker_wrap.py attach" C-m
tmux send-keys -t leap-dev:4 "cd /opt/ff" C-m
tmux send-keys -t leap-dev:4 "./docker_wrap.py attach" C-m
tmux send-keys -t leap-dev:5 "cd /opt/ff" C-m
tmux send-keys -t leap-dev:6 "cd /opt/ff" C-m
tmux send-keys -t leap-dev:7 "cd /opt/ff" C-m
tmux send-keys -t leap-dev:8 "cd /opt/ff" C-m

tmux select-window -t leap-dev:vim-1
tmux attach-session -t leap-dev
