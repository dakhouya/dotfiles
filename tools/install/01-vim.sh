#!/bin/bash

install()
{
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
}