#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @tokyodark-tmux_theme)"
TRANSPARENT_THEME="$(tmux show-option -gv @tokyodark-tmux_transparent)"

case $SELECTED_THEME in
*)
  # Default to tokyodark theme
  declare -A THEME=(
    ["background"]="#1A1B26"
    ["foreground"]="#a9b1d6"

    ["black"]="#06080a"
    ["blue"]="#7199ee"
    ["cyan"]="#38a89d"
    ["green"]="#95c561"
    ["magenta"]="#a485dd"
    ["red"]="#ee6d85"
    ["white"]="#a0a8cd"
    ["yellow"]="#d7a65f"

    ["bblack"]="#06080a"
    ["bblue"]="#7199ee"
    ["bcyan"]="#38a89d"
    ["bgreen"]="#98c379"
    ["bmagenta"]="#a485dd"
    ["bred"]="#fe6d85"
    ["bwhite"]="#a0a8cd"
    ["byellow"]="#d7a65f"

    ["ghbackground"]="#30363d"
    ["ghgreen"]="#587738"
    ["ghmagenta"]="#a485dd"
    ["ghred"]="#773440"
    ["ghyellow"]="#f6955b"
  )
  ;;
esac

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
