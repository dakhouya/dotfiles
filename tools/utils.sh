#!/bin/bash

# Colors
NC="\033[0m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"

export DOTFILE_TOOLS_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
export DOTFILES_DIR="${DOTFILE_TOOLS_DIR}/.."

function echo_c 
{
   echo -e "${1}${2}${NC}"
}

function check_sudo 
{
    if [ "$EUID" -ne 0 ]; then
        echo_c ${YELLOW} "This section require sudo priviledge to install apt packages prompt will be shown"
    fi
}