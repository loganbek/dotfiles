#!/usr/bin/env bash

# WSL Setup Script for Dotfiles
# This script configures WSL-specific settings and adjustments

echo "🐧 Setting up dotfiles for WSL..."

# Detect if we're running in WSL
if grep -qi microsoft /proc/version; then
    echo "✓ WSL detected"
    export IS_WSL=true
else
    echo "❌ Not running in WSL. Exiting."
    exit 1
fi

# WSL-specific environment variables
export WINHOME="/mnt/c/Users/$USER"
export BROWSER="wslview"

# Create symbolic links to Windows directories
echo "📁 Creating links to Windows directories..."
ln -sfn "$WINHOME/Downloads" "$HOME/Downloads"
ln -sfn "$WINHOME/Documents" "$HOME/Documents"
ln -sfn "$WINHOME/Desktop" "$HOME/Desktop"

# Install essential packages for WSL
echo "📦 Installing WSL essentials..."
sudo apt update
sudo apt install -y \
    build-essential \
    curl \
    file \
    git \
    wget \
    unzip \
    fontconfig

# Install wslu (WSL utilities) for better Windows integration
sudo apt install -y wslu

echo "✅ WSL setup complete!"
