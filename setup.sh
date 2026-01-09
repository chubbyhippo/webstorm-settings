#!/usr/bin/env sh

RAW_INTELLIJ_SETTINGS_URL="https://raw.githubusercontent.com/chubbyhippo/intellij-settings/refs/heads/main"
RAW_IDEAVIM_URL="https://raw.githubusercontent.com/chubbyhippo/intellij-settings/refs/heads/main/ideavim"
RAW_WEBSTORM_SETTINGS_URL="https://raw.githubusercontent.com/chubbyhippo/webstorm-settings/refs/heads/main"

# config paths
for config_path in \
  "$HOME"/.config/JetBrains/WebStorm* \
  "$HOME"/Library/Application\ Support/JetBrains/WebStorm* \
  "$HOME"/AppData/Roaming/JetBrains/WebStorm*; do
  if [ -d "$config_path" ]; then
    echo "$config_path"
    # install code styles
    mkdir -p "$config_path/codestyles"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/codestyles/Default.xml" -o "$config_path/codestyles/Default.xml"

    # install keymaps
    mkdir -p "$config_path/keymaps"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/keymaps/chubbyhippo.xml" -o "$config_path/keymaps/chubbyhippo.xml"

    # install options
    mkdir -p "$config_path/options"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/editor.xml" -o "$config_path/options/editor.xml"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/laf.xml" -o "$config_path/options/laf.xml"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/colors.scheme.xml" -o "$config_path/options/colors.scheme.xml"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/postfixTemplates.xml" -o "$config_path/options/postfixTemplates.xml"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/projectView.xml" -o "$config_path/options/projectView.xml"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/ui-datetime.xml" -o "$config_path/options/ui-datetime.xml"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/ui.lnf.xml" -o "$config_path/options/ui.lnf.xml"
    mkdir -p "$config_path/options/mac"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/mac/keymap.xml" -o "$config_path/options/mac/keymap.xml"
    mkdir -p "$config_path/options/windows"
    curl -ksS "$RAW_INTELLIJ_SETTINGS_URL/config/options/windows/keymap.xml" -o "$config_path/options/windows/keymap.xml"
  fi
done

# install .ideavimrc
curl -ksS "$RAW_IDEAVIM_URL/.ideavimrc" -o ~/.ideavimrc

# install plugins
curl -ksS "$RAW_WEBSTORM_SETTINGS_URL/install-plugins.sh" | /usr/bin/env sh
