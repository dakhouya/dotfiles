#! /bin/bash

DOTFILES_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

echo "Install vim files"
if ! which vim; then
    echo "Install vim before running this script"
    exit 1
fi

ln -sf $DOTFILES_DIR/.vim $HOME/.vim
ln -sf $DOTFILES_DIR/.vimrc $HOME/.vimrc
vim +PlugInstall +qall

echo "Install git files"
ls -sf $DOTFILES_DIR/.gitconfig $HOME/.gitconfig

echo "Done!"
echo ""
