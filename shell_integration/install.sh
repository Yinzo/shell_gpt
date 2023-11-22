#!/bin/sh

# URLs of the shell scripts for ZSH and BASH
ZSH_SCRIPT_URL="https://raw.githubusercontent.com/Yinzo/shell_gpt/shell-integration-main/shell_integration/zsh.sh"
BASH_SCRIPT_URL="https://raw.githubusercontent.com/Yinzo/shell_gpt/shell-integration-main/shell_integration/bash.sh"

# Identify the shell
case $SHELL in
  *'zsh'*)
    echo "Current shell is ZSH."
    SHELL_SCRIPT_URL=$ZSH_SCRIPT_URL
    PROFILE_FILE="$HOME/.zshrc"
    ;;
  *'bash'*)
    echo "Current shell is BASH."
    SHELL_SCRIPT_URL=$BASH_SCRIPT_URL
    PROFILE_FILE="$HOME/.bashrc"
    ;;
  *)
    echo "Your shell is not supported yet."
    echo "Current shell is neither ZSH nor BASH. Aborting."
    exit 1
    ;;
esac

# Download the appropriate script
echo "Downloading shell script from $SHELL_SCRIPT_URL..."
echo "Appending the script to $PROFILE_FILE..."
curl -fsSL $SHELL_SCRIPT_URL >> $PROFILE_FILE

echo "Done."
