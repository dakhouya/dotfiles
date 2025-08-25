#!/bin/bash

# Colors
COLOR_NC="\033[0m"
COLOR_RED="\033[0;31m"
COLOR_CYAN="\033[36m"
COLOR_YELLOW="\033[0;33m"

export DOTFILE_TOOLS_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
export DOTFILES_DIR="${DOTFILE_TOOLS_DIR}/.."

check_sudo()
{
    if [ "$EUID" -ne 0 ]; then
        log_warn "This section require sudo priviledge to install apt packages prompt will be shown"
    fi
}

log() {
    echo -e "${COLOR_CYAN}$*${COLOR_NC}"
}

log_inline() {
    local msg="$*"
    echo -ne "${COLOR_CYAN}$msg${COLOR_RESET}\r"
}

log_warn() {
    echo -e "${COLOR_YELLOW}[WARN] $*${COLOR_NC}"
}

log_error() {
    echo -e "${COLOR_RED}[ERROR] $*${COLOR_NC}" >&2
}