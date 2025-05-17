#!/bin/bash
set -e

echo "Installing GitHub Copilot extensions..."

# Install the core Copilot extension first
code-server --install-extension /copilot.vsix
# Wait a moment for extension registration
sleep 2
# Then install Copilot Chat
code-server --install-extension /copilot-chat.vsix

# Verify installations
echo "Verifying extensions installation..."
code-server --list-extensions | grep copilot

# Setup coder directories
mkdir -p /home/coder/.local/share/code-server/User

# Add settings for Copilot to ensure it works correctly
cat > /home/coder/.local/share/code-server/User/settings.json << EOF
{
  "github.copilot.enable": {
    "*": true
  },
  "editor.inlineSuggest.enabled": true
}
EOF

# Copy over extensions
cp -r ~/.local/share/code-server/extensions /home/coder/.local/share/code-server/

# Adjust permissions
chown -R coder:coder /home/coder

# Cleanup
rm -f /copilot.vsix
rm -f /copilot-chat.vsix

echo "Setup completed successfully!"

