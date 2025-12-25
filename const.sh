#!/bin/bash

TOOLS_DIR=$(dirname "$(realpath "$0")")
USERNAME=$(<"$TOOLS_DIR/username.txt")
PASSWORD=$(<"$TOOLS_DIR/password.txt")

GITEA_URL="https://git.lunarflame.dev"
GITEA_DIR=$(<"$TOOLS_DIR/gitea_dir.txt")

LFS_DIR="${GITEA_DIR}/LFS"
