#!/bin/bash

# install the extensions
code-server --install-extension /copilot.vsix
code-server --install-extension /copilot-chat.vsix

# Setup coder directories.
mkdir -p /home/coder/.local/share/code-server/User

# Setup configuration files.
#mv -f /vscode-settings.json /home/coder/.local/share/code-server/User/settings.json
#mv -f /teros-config.json /home/coder/.prj_config.teros

# Copy over extensions.
cp -r ~/.local/share/code-server/extensions /home/coder/.local/share/code-server/

# Adjust permissions.
chown -R coder:coder /home/coder

# Cleanup.
rm -f /copilot.vsix
rm -f /copilot-chat.vsix
