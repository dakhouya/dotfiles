#!/bin/bash

# Colors
NC="\033[0m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"

DOTFILES_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

function echo_c {
  echo -e "${1}${2}${NC}"
}

echo_c ${YELLOW} "Install prerequisite"
if ! sudo apt-get install -qq git curl vim zsh -y; then 
    echo_c ${RED} "Fail to install prerequisite"
    exit 1
fi

echo_c ${YELLOW} "Install vim files"
VIM_SYMLINK=${HOME}/.vim
if [ ! -L ${VIM_SYMLINK} ] || [ ! -e ${VIM_SYMLINK} ]; then
    ln -sf $DOTFILES_DIR/.vim ${VIM_SYMLINK}
else 
    echo_c ${YELLOW} "${VIM_SYMLINK} already created"
fi

VIMRC_SYMLINK=${HOME}/.vimrc
if [ ! -L ${VIMRC_SYMLINK} ] || [ ! -e ${VIMRC_SYMLINK} ]; then
    ln -sf $DOTFILES_DIR/.vimrc ${VIMRC_SYMLINK}
else 
    echo_c ${YELLOW} "${VIMRC_SYMLINK} already created"
fi
vim +PlugInstall +qall > /dev/null

echo_c ${YELLOW} "Set zsh as default shell"
if ! sudo usermod -s $(which zsh) $USER; then
    echo_c ${RED} "Fail to set zsh as default shell"
    exit 1
fi

echo_c ${YELLOW} "Install ohmyzsh"
if [ ! -d ~/.oh-my-zsh ]; then
	if ! sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
        echo_c ${RED} "Fail to install ohmyzsh"
        exit 1
    fi
else
 	echo_c ${YELLOW} "oh-my-zsh is already installed"
fi

echo_c ${YELLOW} "Install git files"
GITCONFIG_SYMLINK=${HOME}/.gitconfig
if [ ! -L ${GITCONFIG_SYMLINK} ] || [ ! -e ${GITCONFIG_SYMLINK} ]; then
    ln -sf $DOTFILES_DIR/.gitconfig ${GITCONFIG_SYMLINK}
else 
    echo_c ${YELLOW} "${GITCONFIG_SYMLINK} already created"
fi

echo_c ${GREEN} "Dotfiles installation completed!"
echo_c ${GREEN} "Please reboot to make sure all changes are applied"
