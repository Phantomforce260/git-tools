#!/bin/bash

TOOLS_DIR="$HOME/Documents/Github/Phantom/git-tools"
USERNAME=$(<"$TOOLS_DIR/username.txt")
PASSWORD=$(<"$TOOLS_DIR/password.txt")

LFS_DIR="$HOME/Documents/Gitea/LFS"

GITEA_URL="https://git.lunarflame.dev"