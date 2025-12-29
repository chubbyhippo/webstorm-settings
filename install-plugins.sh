#!/usr/bin/env sh

# plugins
cmd=webstorm
if uname | grep -q "^MINGW"; then
  if command -v webstorm.cmd >/dev/null 2>&1; then
    cmd=webstorm.cmd
  elif command -v webstorm64 >/dev/null 2>&1; then
    cmd=webstorm.64
  else
    echo "Warning: neither webstorm.cmd nor webstorm64 found, falling back to pycharm"
  fi
fi
$cmd installPlugins \
  IdeaVIM \
  StringToolsPlugin \
  com.fwdekker.randomness \
  com.github.camork.fileExpander \
  com.joshestein.ideavim-quickscope \
  com.julienphalip.ideavim.peekaboo \
  com.jetbrains.kmm \
  com.joshestein.ideavim-quickscope \
  eu.theblob42.idea.whichkey \
  indent-rainbow.indent-rainbow \
  izhangzhihao.rainbow.brackets.lite \
  org.asciidoctor.intellij.asciidoc \
  org.sonarlint.idea
