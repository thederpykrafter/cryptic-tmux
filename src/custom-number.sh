#!/usr/bin/env bash

# Imports
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
. "${ROOT_DIR}/lib/coreutils-compat.sh"

format_hide=""
format_none="0123456789"
format_digital="󰫼󰬺󰬻󰬼󰬽󰬾󰬿󰭀󰭁󰭂"
format_fsquare="󰎡󰎤󰎧󰎪󰎭󰎱󰎳󰎶󰎹󰎼"
format_hsquare="󰎣󰎦󰎩󰎬󰎮󰎰󰎵󰎸󰎻󰎾"
format_dfsquare="󰼎󰼏󰼐󰼑󰼒󰼓󰼔󰼕󰼖󰼗"
format_dsquare="󰎢󰎥󰎨󰎫󰎲󰎯󰎴󰎷󰎺󰎽"
format_roman=" 󱂈󱂉󱂊󱂋󱂌󱂍󱂎󱂏󱂐"
format_super="⁰¹²³⁴⁵⁶⁷⁸⁹"
format_sub="₀₁₂₃₄₅₆₇₈₉"
format_hcircle="⓪➀➁➂➃➄➅➆➇➈"
format_dcircle=" ⓵⓶⓷⓸⓹⓺⓻⓼⓽"
format_fcircle="⓿➊➋➌➍➎➏➐➑➒"
format_fullstop="🄀⒈⒉⒊⒋⒌⒍⒎⒏⒐"
format_monospace="𝟶𝟷𝟸𝟹𝟺𝟻𝟼𝟽𝟾𝟿"
format_lines="𝟘𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡"

ID=$1
FORMAT=${2:-none}

# Preserve leading whitespace for bash
format="$(eval echo \"\$format_${FORMAT}\")"

if [ "$FORMAT" = "hide" ]; then
  exit 0
fi

if [ -z "$format" ]; then
  echo "Invalid format: $FORMAT"
  exit 1
fi

# If format is roman numerals (-r), only handle IDs of 1 digit
if [ "$FORMAT" = "roman" ] && [ ${#ID} -gt 1 ]; then
  echo -n "$ID "
else
  for ((i = 0; i < ${#ID}; i++)); do
    DIGIT=${ID:i:1}
    echo -n "${format:DIGIT:1} "
  done
fi
