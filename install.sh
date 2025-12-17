#!/bin/bash

# Pomodoro Timer Install Script

SCRIPT_NAME="pomodrom"
INSTALL_DIR="/usr/local/bin"

echo "🍅 Pomodoro Timer Installer"
echo ""

# Check if script exists
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "❌ Error: $SCRIPT_NAME not found in current directory"
    exit 1
fi

# Check if running with sudo/root
if [ "$EUID" -ne 0 ]; then
    echo "⚠️  This script needs sudo privileges to install to $INSTALL_DIR"
    echo ""
    echo "Please run: sudo ./install.sh"
    exit 1
fi

# Make executable
echo "→ Making $SCRIPT_NAME executable..."
chmod +x "$SCRIPT_NAME"

# Copy to install directory
echo "→ Installing to $INSTALL_DIR..."
cp "$SCRIPT_NAME" "$INSTALL_DIR/"

# Verify installation
if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
    echo ""
    echo "✓ Installation complete!"
    echo ""
    echo "You can now run 'pomodrom' from anywhere"
    echo ""
    echo "Usage examples:"
    echo "  pomodrom              # Use defaults (25/5/15 mins)"
    echo "  pomodrom 30 10 20 3   # Custom times"
else
    echo ""
    echo "❌ Installation failed"
    exit 1
fi
