#!/bin/bash

sudo dnf update -y
sudo dnf install bat

ALIAS_NAME="add_codeberg_remote"
SCRIPT_TO_ALIAS="add_codeberg_remote.sh"
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
ALIAS_COMMAND="alias $ALIAS_NAME=\"bash $SCRIPT_DIR/$SCRIPT_TO_ALIAS\""

# Check if .bashrc exists and is a file
if [ -f "$HOME/.bashrc" ]; then
    # Check if the alias already exists in .bashrc
    if ! grep -q "alias $ALIAS_NAME=" "$HOME/.bashrc"; then
        echo "Adding alias '$ALIAS_NAME' to ~/.bashrc."
        echo "" >> "$HOME/.bashrc"
        echo "# Alias for $SCRIPT_TO_ALIAS" >> "$HOME/.bashrc"
        echo "$ALIAS_COMMAND" >> "$HOME/.bashrc"
        echo "Please run 'source ~/.bashrc' or restart your terminal to apply the changes."
    else
        echo "Alias '$ALIAS_NAME' already exists in ~/.bashrc. No changes were made."
    fi
else
    echo "Error: ~/.bashrc not found."
fi
