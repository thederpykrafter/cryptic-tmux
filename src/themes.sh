#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @tokyodark-tmux_theme)"
TRANSPARENT_THEME="$(tmux show-option -gv @tokyodark-tmux_transparent)"

case $SELECTED_THEME in
  pywal)
    source ~/.cache/wal/colors.sh
    # Default to tokyodark theme
    declare -A THEME=(
      ["background"]=$background
      ["foreground"]=$foreground

      ["black"]=$color0
      ["bblack"]=$color8

      ["red"]=$color1
      ["bred"]=$color9

      ["green"]=$color2
      ["bgreen"]=$color10

      ["yellow"]=$color3
      ["breakyellow"]=$color11

      ["blue"]=$color4
      ["bblue"]=$color12

      ["magenta"]=$color5
      ["bmagenta"]=$color13

      ["cyan"]=$color6
      ["bcyan"]=$color14

      ["white"]=$color7
      ["bwhite"]=$color15

      ["ghbackground"]="#30363d"
      ["ghgreen"]="#587738"
      ["ghmagenta"]="#a485dd"
      ["ghred"]="#773440"
      ["ghyellow"]="#f6955b"
    )
      ;;
    *)
      # Default to tokyodark theme
      declare -A THEME=(
        ["background"]="#1A1B26"
        ["foreground"]="#a9b1d6"

        ["black"]="#06080a"
        ["bblack"]="#212234"

        ["red"]="#ff5458"
        ["bred"]="#ee6d85"

        ["green"]="#62d196"
        ["bgreen"]="#95c561"

        ["byellow"]="#d7a65f"
        ["yellow"]="#ffe9aa"

        ["blue"]="#7199ee"
        ["bblue"]="#65b2ff"

        ["magenta"]="#906cff"
        ["bmagenta"]="#a485dd"

        ["cyan"]="#38a89d"
        ["bcyan"]="#62d196"

        ["bwhite"]="#565575"
        ["white"]="#a0a8cd"

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
