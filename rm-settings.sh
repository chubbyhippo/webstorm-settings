#!/usr/bin/env sh

for config_path in \
"$HOME"/.config/JetBrains/WebStorm* \
"$HOME"/Library/Application\ Support/JetBrains/WebStorm* \
"$HOME"/AppData/Roaming/JetBrains/WebStorm*

do
  echo "$config_path"
  if [ -d "$config_path" ]; then
    rm -rf "$config_path"
  fi
done
