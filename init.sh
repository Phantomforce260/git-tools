#!/bin/bash

echo "This repo will add git commands to help interface with the LunarFlame Git Server."
echo "Where are your Gitea Projects stored?"

contains_gitea_dir() {
    local dir="$1"
    local folder_name="Gitea"

    find "$dir" -maxdepth 1 -type d -iname "$folder_name" -print -quit | grep -q .
}

add_if_missing() {
    FILE="$1"
    LINE="$2"

    # Create file if it doesn't exist
    [ -f "$FILE" ] || touch "$FILE"

    # Add if not already present
    if ! grep -Fq "$LINE" "$FILE"; then
        printf '\n# Added by git-tools\n%s\n' "$LINE" >> "$FILE"
        echo "Updated $FILE"
    else
        echo "File already contains the PATH."
    fi
}

input_dir=""

while true; do
    read -r -p "> " input_dir

    if [ ! -d "$input_dir" ]; then
        echo "Not a valid directory. Please try again."
        continue
    fi

    if contains_gitea_dir "$input_dir"; then
        echo "Found Gitea directory in '$input_dir'."
        break
    else
        echo "Could not find Gitea directory in '$input_dir'. Please try again."
    fi
done

echo "${input_dir}/Gitea" > gitea_dir.txt

TOOLS_DIR=$(dirname "$(realpath "$0")")
GIT_TOOLS_PATH="export PATH=\"$TOOLS_DIR:\$PATH\""

if [ -n "$ZSH_VERSION" ]; then
    echo "Detected zsh. Updating zshrc..."
    add_if_missing "$HOME/.zshrc" "$GIT_TOOLS_PATH"
    echo "Done. Run 'source ~/zshrc'"
elif [ -n "$BASH_VERSION" ]; then
    echo "Detected bash. Updating bashrc..."
    add_if_missing "$HOME/.bashrc" "$GIT_TOOLS_PATH"
    echo "Done. Run 'source ~/bashrc'"
else
    echo "Could not find rc file."
fi
