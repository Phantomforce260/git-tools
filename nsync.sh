#!/bin/bash

PULL="git pull origin"

DCF_CMD="(echo dockerfiles: && cd ~/dockerfiles && $PULL)"
DTF_CMD="(echo dotfiles: && cd ~/.config/dotfiles && $PULL)"
GT_CMD="(echo git-tools: && cd ~/.config/git-tools && $PULL)"
NV_CMD="(echo nvim: && cd ~/.config/nvim && $PULL)"

BASE_CMD="$DTF_CMD && $GT_CMD && $NV_CMD"
CMD="$DCF_CMD && $BASE_CMD"

echo "VMs:"
echo ""

for vm in thebel arqa yabbashah tziah; do
    echo "${vm}:"
    ssh $vm $CMD || echo "SSH to $vm failed."
    echo ""
done

echo "Hosts:"
echo ""

for host in tartarus lunarflame.dev raspberrypi; do
    echo "${host}:"
    ssh $host $BASE_CMD || echo "SSH to $host failed."
    echo ""
done

echo "Done."
