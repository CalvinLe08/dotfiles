#!/bin/bash

set -e  # Exit on errors

# Define base directories
DOTFILES_DIR=~/dotfiles
CONFIG_DIR=$DOTFILES_DIR/config
SCRIPTS_DIR=$DOTFILES_DIR/scripts

# Ensure .config directory exists
mkdir -p ~/.config

# Create symlinks for configuration files
ln -svnf $CONFIG_DIR/aerospace ~/.config/aerospace
ln -svnf $CONFIG_DIR/alacritty ~/.config/alacritty
ln -svnf $CONFIG_DIR/nvim ~/.config/nvim
ln -svnf $CONFIG_DIR/starship ~/.config/starship
ln -svnf $CONFIG_DIR/ghostty ~/.config/ghostty

# Additional symlinks for specific files
ln -svnf $CONFIG_DIR/zsh/.zshrc ~/.zshrc
ln -svnf $CONFIG_DIR/zsh/alias.zsh ~/.config/zsh/alias.zsh
ln -svnf $CONFIG_DIR/starship/starship.toml ~/.config/starship.toml
ln -svnf $CONFIG_DIR/tmux/.tmux.conf ~/.tmux.conf

# Print completion message
echo "Symlinks created successfully!"

