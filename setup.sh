#!/usr/bin/env sh

RAW_ITELLIJ_SETTINGS_URL="https://raw.githubusercontent.com/chubbyhippo/intellij-settings/refs/heads/main"
RAW_IDEAVIM_URL="https://raw.githubusercontent.com/chubbyhippo/ideavimrc/refs/heads/main"
RAW_WEBSTORM_SETTINGS_URL="https://raw.githubusercontent.com/chubbyhippo/webstorm-settings/refs/heads/main"

# config paths
for config_path in \
  "$HOME"/.config/JetBrains/WebStorm* \
  "$HOME"/Library/Application\ Support/JetBrains/WebStorm* \
  "$HOME"/AppData/Roaming/JetBrains/WebStorm*; do
  echo "$config_path"
  if [ -d "$config_path" ]; then
    echo "$config_path"
    # install code styles
    mkdir -p "$config_path/codestyles"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/codestyles/Default.xml" -o "$config_path/codestyles/Default.xml"

    # install keymaps
    mkdir -p "$config_path/keymaps"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/keymaps/chubbyhippo.xml" -o "$config_path/keymaps/chubbyhippo.xml"

    # install options
    mkdir -p "$config_path/options"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/editor.xml" -o "$config_path/options/editor.xml"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/laf.xml" -o "$config_path/options/laf.xml"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/colors.scheme.xml" -o "$config_path/options/colors.scheme.xml"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/postfixTemplates.xml" -o "$config_path/options/postfixTemplates.xml"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/projectView.xml" -o "$config_path/options/projectView.xml"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/ui.lnf.xml" -o "$config_path/options/ui.lnf.xml"
    mkdir -p "$config_path/options/mac"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/mac/keymap.xml" -o "$config_path/options/mac/keymap.xml"
    mkdir -p "$config_path/options/windows"
    curl -k "$RAW_ITELLIJ_SETTINGS_URL/config/options/windows/keymap.xml" -o "$config_path/options/windows/keymap.xml"
  fi
done

# install .ideavimrc
curl -k "$RAW_IDEAVIM_URL/.ideavimrc" -o ~/.ideavimrc

# install plugins
curl -k "$RAW_WEBSTORM_SETTINGS_URL/install-plugins.sh" | /usr/bin/env sh
