#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
source ${SCRIPT_DIR}/utils.sh

INSTALL_SCRIPTS_DIR="${SCRIPT_DIR}/install"

# Function: run install() from all scripts in a folder
run_install() {
    local folder="${INSTALL_SCRIPTS_DIR}"

    if [ ! -d "$folder" ]; then
        echo_c ${RED} "Folder not found: $folder"
        return 1
    fi

    for file in "$folder"/*; do
        # Skip if not a regular file
        [ -f "$file" ] || continue
        
        echo_c ${YELLOW} "Processing $(basename $file)"
        # Source the file so its functions are available
        source "$file"
        
        # Check if it has an 'install' function
        if declare -F install >/dev/null; then
            if ! install; then
                echo_c ${RED} "Fail to install $file"
                return 1
            fi
            # Clean up (unset) to avoid conflicts between files
            unset -f install
        else
            echo_c ${RED} "No install() function found in $file"
            return 1
        fi
    done
}

if ! run_install; then
    exit 1
fi

echo_c ${GREEN} "Dotfiles installation completed!"
echo_c ${GREEN} "Restart your terminal to see changes"
