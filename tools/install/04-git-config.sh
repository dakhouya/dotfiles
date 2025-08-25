#!/bin/bash

install()
{
    GITCONFIG_SYMLINK=${HOME}/.gitconfig
    if [ ! -L ${GITCONFIG_SYMLINK} ] || [ ! -e ${GITCONFIG_SYMLINK} ]; then
        ln -sf $DOTFILES_DIR/.gitconfig ${GITCONFIG_SYMLINK}
    fi
}