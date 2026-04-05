#!/usr/bin/env bash

TMUX_DIR="$HOME/.tmux"
REPO_URL="https://github.com/tjian123/.tmux.git"

echo "Installing .tmux configuration..."

if [ -d "$TMUX_DIR" ]; then
    echo "Warning: $TMUX_DIR already exists."
    echo ""
    echo "Options:"
    echo "  [y] Backup existing config and continue (default)"
    echo "  [n] Skip backup, overwrite existing config"
    echo "  [q] Quit"
    echo ""
    read -p "Select option [y/N/q]: " -n 1 -r
    echo
    case $REPLY in
        [Qq])
            echo "Installation cancelled."
            exit 0
            ;;
        [Nn])
            echo "Skipping backup, will overwrite existing config..."
            ;;
        *)
            echo "Backing up existing config..."
            mv "$TMUX_DIR" "$TMUX_DIR.backup.$(date +%Y%m%d%H%M%S)"
            ;;
    esac
fi

echo "Cloning repository..."
git clone "$REPO_URL" "$TMUX_DIR"

echo "Creating symlink..."
ln -sf "$TMUX_DIR/tmux.conf" "$HOME/.tmux.conf"

echo "Initializing TPM..."
mkdir -p ~/.tmux/plugins
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Start tmux: tmux"
echo "2. Press 'prefix + I' (Ctrl+a then I) to install plugins"
echo ""
echo "Note: Replace 'your-username' in the repo URL with your actual GitHub username."
