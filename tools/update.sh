#!/bin/bash
set +oeu pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
source ${SCRIPT_DIR}/utils.sh

DOTFILES_DIR="${SCRIPT_DIR}/.."
# Main upstream branch
MAIN_BRANCH="master"

function check_newer_uptream() {
    git -C $DOTFILES_DIR fetch origin "${MAIN_BRANCH}" --quiet

    if ! git -C $DOTFILES_DIR merge-base --is-ancestor origin/"${MAIN_BRANCH}" "${MAIN_BRANCH}"; then
        return 0
    else
        return 1
    fi
}

pull_if_yes() {
  read -p "Do you want to update dotfiles with the latest changes? [Y/n]: " answer
  case "$answer" in
    [Yy]* )
      echo "Pulling latest changes... "
      git -C $DOTFILES_DIR pull
      ;;
    * )
      echo "Skipped update"
      exit 0
      ;;
  esac
}

if check_newer_uptream; then 
    pull_if_yes
    $SCRIPT_DIR/install.sh
fi