#!/bin/bash

PULL="git pull origin"

DCF_CMD="(echo dockerfiles: && cd ~/dockerfiles && $PULL)"
DTF_CMD="(echo dotfiles: && cd ~/.config/dotfiles && $PULL)"
GT_CMD="(echo git-tools: && cd ~/.config/git-tools && $PULL)"
NV_CMD="(echo nvim: && cd ~/.config/nvim && $PULL)"

CMD="$DCF_CMD && $DTF_CMD && $GT_CMD && $NV_CMD"

echo "thebel:"
ssh thebel $CMD

echo "arqa:"
ssh arqa $CMD

echo "yabbashah:"
ssh yabbashah $CMD

echo "tziah:"
ssh tziah $CMD
