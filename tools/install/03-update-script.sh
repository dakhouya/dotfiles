#!/bin/bash

install()
{
    echo_c ${YELLOW} "Adding dotfile init to ~/.zshrc"
    if [ -z "${DOTFILES}" ]; then
        echo "" >> ${HOME}/.zshrc
        echo "# Add custom dotfile installation" >> ${HOME}/.zshrc
        echo export DOTFILES="$(realpath $DOTFILES_DIR)" >> ${HOME}/.zshrc
        echo '${DOTFILES}/tools/update.sh' >> ${HOME}/.zshrc
    fi
}