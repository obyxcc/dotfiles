#!/bin/bash

# @requires: wireplumber

percentage () {
  local val=$1
  local icon1=$2
  local icon2=$3
  local icon3=$4
  local icon4=$5
  if [ "$val" -le 15 ]; then
    echo $icon1
  elif [ "$val" -le 30 ]; then
    echo $icon2
  elif [ "$val" -le 60 ]; then
    echo $icon3
  else
    echo $icon4
  fi
}

is_muted () {
  pacmd list-sinks | awk '/muted/ { print $2 }'
}

get_percentage () {
  # local muted=$(is_muted)
  if [[ $muted == 'yes' ]]; then
    echo 0
  else
    per=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 * 100 }')
    echo "${per}"
  fi
}

get_icon () {
  local vol=$(get_percentage)
  if [[ $vol == "0" ]]; then
    echo "婢"
  else
    echo $(percentage "$vol" "" "" "墳" "")
  fi
}

get_class () {
  local vol=$(get_percentage)
  if [[ $vol == "0" ]]; then
    echo "red"
  else
    echo $(percentage "$vol" "red" "magenta" "yellow" "blue")
  fi
}

get_vol () {
  local percent=$(get_percentage)
  echo $percent
}

if [[ $1 == "icon" ]]; then
  get_icon
fi

if [[ $1 == "class" ]]; then
  get_class
fi

if [[ $1 == "percentage" ]]; then
  get_percentage
fi

if [[ $1 == "vol" ]]; then
  get_vol
fi

if [[ $1 == "muted" ]]; then
  is_muted
fi

if [[ $1 == "toggle-muted" ]]; then
  pactl set-sink-mute $SINK toggle
fi

if [[ $1 == "set" ]]; then
  val=$(echo $2 | tr '.' ' ' | awk '{print $1 / 100}')
  if test $val -gt 100; then
    val=100
  fi
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $val
fi
