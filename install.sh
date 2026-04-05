#!/usr/bin/env bash

set -e

TMUX_DIR="$HOME/.tmux"
REPO_URL="https://github.com/your-username/.tmux.git"

echo "Installing .tmux configuration..."

if [ -d "$TMUX_DIR" ]; then
    echo "Warning: $TMUX_DIR already exists."
    read -p "Do you want to backup and replace it? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 1
    fi
    mv "$TMUX_DIR" "$TMUX_DIR.backup.$(date +%Y%m%d%H%M%S)"
fi

echo "Cloning repository..."
git clone "$REPO_URL" "$TMUX_DIR"

echo "Creating symlink..."
ln -sf "$TMUX_DIR/tmux.conf" "$HOME/.tmux.conf"

echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Start tmux: tmux"
echo "2. Press 'prefix + I' (Ctrl+a then I) to install plugins"
echo ""
echo "Note: Replace 'your-username' in the repo URL with your actual GitHub username."
