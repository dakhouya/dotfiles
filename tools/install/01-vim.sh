#!/bin/bash

install()
{
    VIM_SYMLINK=${HOME}/.vim
    if [ ! -L ${VIM_SYMLINK} ] || [ ! -e ${VIM_SYMLINK} ]; then
        ln -sf $DOTFILES_DIR/.vim ${VIM_SYMLINK}
    fi

    VIMRC_SYMLINK=${HOME}/.vimrc
    if [ ! -L ${VIMRC_SYMLINK} ] || [ ! -e ${VIMRC_SYMLINK} ]; then
        ln -sf $DOTFILES_DIR/.vimrc ${VIMRC_SYMLINK}
    fi
    
    vim +'PlugInstall --sync' +qall </dev/tty >/dev/null 2>&1
}