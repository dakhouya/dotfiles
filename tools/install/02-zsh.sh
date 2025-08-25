#!/bin/bash

install()
{
    default_shell=$(getent passwd "$USER" | cut -d: -f7)
    if [[ "$default_shell" != *"zsh" ]]; then
        echo_c ${YELLOW} "Set zsh as default shell"
        check_sudo
        if ! sudo usermod -s $(which zsh) $USER; then
            echo_c ${RED} "Fail to set zsh as default shell"
            return 1
        fi
    fi

    echo_c ${YELLOW} "Install oh-my-zsh"
    if [ ! -d ~/.oh-my-zsh ]; then
        if ! sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
            echo_c ${RED} "Fail to install oh-my-zsh"
            return 1
        fi
    fi

    echo_c ${YELLOW} "Install custom oh-my-zsh files"
    cp -r "$DOTFILES_DIR/.oh-my-zsh/custom" "$HOME/.oh-my-zsh/"
    ZSHRC="$HOME/.zshrc"
    THEME_NAME="robbyrussel-dk"
    sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="'"$THEME_NAME"'"/' "$ZSHRC"
}