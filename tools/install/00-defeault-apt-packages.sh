#!/bin/bash

# Install default apt packages
install()
{
    packages=(
        ack
        curl
        git 
        vim 
        zsh
    )

    if ! check_packages "${packages[@]}"; then
        check_sudo

        if ! install_packages "${packages[@]}"; then
            echo_c ${RED} "Fail to install apt packages"
            return 1
        fi
    fi

    return 0
}

# Function: check if all given packages are installed
check_packages() {
    local missing=()
    for pkg in "$@"; do
        if ! dpkg -s "$pkg" &>/dev/null; then
            missing+=("$pkg")
        fi
    done

    if [ ${#missing[@]} -ne 0 ]; then
        echo_c ${YELLOW} "Missing packages to be installed: ${missing[*]}"
        return 1
    fi
}

# Function: install packages (requires sudo)
install_packages() {
    echo_c ${YELLOW} "Installing packages: $*"
    sudo apt-get update
    sudo apt-get install -y "$@"
}
