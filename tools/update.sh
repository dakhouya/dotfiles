#!/bin/bash
set +oeu pipefail

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
source ${SCRIPT_DIR}/utils.sh

DOTFILES_DIR="${SCRIPT_DIR}/.."
# Main upstream branch
MAIN_BRANCH="master"
GIT_CMD="git -C $DOTFILES_DIR"
check_newer_uptream() 
{
    ${GIT_CMD} fetch origin "${MAIN_BRANCH}" --quiet

    if ! ${GIT_CMD} merge-base --is-ancestor origin/"${MAIN_BRANCH}" "${MAIN_BRANCH}"; then
        return 0
    else
        return 1
    fi
}

pull_if_yes() 
{
  log "Do you want to update dotfiles with the latest changes? [Y/n]: "
  read answer
  case "$answer" in
    [Yy]* )
      log "Pulling latest changes... "
      ${GIT_CMD} pull
      git_preview_pull
      ;;
    * )
      log "Skipped update"
      exit 0
      ;;
  esac
}

git_preview_pull() {
    ${GIT_CMD} diff --numstat HEAD..origin/"$MAIN_BRANCH" | while read added removed file; do
        [ -z "$file" ] && continue

        local color symbol

        if [ "$added" != "0" ] && [ "$removed" == "0" ]; then
            color="$COLOR_GREEN"
            symbol="+"
        elif [ "$added" == "0" ] && [ "$removed" != "0" ]; then
            color="$COLOR_RED"
            symbol="-"
        else
            color="$COLOR_YELLOW"
            symbol="±"
        fi

        printf "${color}%s %s (+%s/-%s)${COLOR_NC}\n" "$symbol" "$file" "$added" "$removed"
    done
}

if check_newer_uptream; then 
    pull_if_yes
    $SCRIPT_DIR/install.sh
fi