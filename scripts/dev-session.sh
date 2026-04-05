#!/usr/bin/env bash

SESSION="dev"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESSION -n editor

  # pane 布局
  tmux split-window -h -t $SESSION
  tmux split-window -v -t $SESSION:0.0
  tmux split-window -v -t $SESSION:0.1

  # pane 说明：
  # 0: editor / shell
  # 1: backend
  # 2: frontend
  # 3: docker / db

  tmux send-keys -t $SESSION:0.0 "nvim" C-m
  tmux send-keys -t $SESSION:0.1 "uvicorn main:app --reload" C-m
  tmux send-keys -t $SESSION:0.2 "npm run dev" C-m
  tmux send-keys -t $SESSION:0.3 "docker compose up" C-m

  tmux select-pane -t 0
fi

tmux attach -t $SESSION
