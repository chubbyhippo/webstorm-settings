#!/usr/bin/env sh

# plugins
cmd=webstorm
if uname | grep -q "^MINGW"; then
	cmd="$HOME"/AppData/Local/JetBrains/Toolbox/scripts/webstorm.cmd
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
	org.sonarlint.idea
