#!/usr/bin/env sh

# plugins
cmd=webstorm
if uname | grep -q "^MINGW"; then
	cmd="$HOME"/AppData/Local/JetBrains/Toolbox/scripts/webstorm.cmd
fi

$cmd installPlugins \
	IdeaVIM \
	com.jetbrains.kmm \
	com.joshestein.ideavim-quickscope \
	eu.theblob42.idea.whichkey \
	com.haulmont.rcb
