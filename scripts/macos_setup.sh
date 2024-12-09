#!/bin/bash

# Set up dotfiles repository URL (replace with your repository URL)
DOTFILES_REPO="https://github.com/your-username/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# Clone the dotfiles repository if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repository..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "Dotfiles repository already exists."
  cd "$DOTFILES_DIR" && git pull origin main
fi

# Install Homebrew if it's not installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found, installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Install essential packages using Homebrew
echo "Installing essential packages..."
brew install \
  git \
  zsh \
  nvm \
  fzf \
  thefuck \
  powerlevel10k \
  mysql \
  tmux \
  neovim \
  font-fira-code \
  starship

# Install tmux plugin manager (tpm) for managing tmux plugins
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "Tmux plugin manager is already installed."
fi

# Install Aerospace plugin for tmux
if [ ! -d "$HOME/.tmux/plugins/aerospace" ]; then
  echo "Installing Aerospace plugin for tmux..."
  git clone https://github.com/tmux-plugins/aerospace "$HOME/.tmux/plugins/aerospace"
else
  echo "Aerospace plugin is already installed."
fi

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# Install Node Version Manager (nvm)
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

# Set up Java (if needed)
echo "Setting up Java environment..."
export JAVA_HOME=/opt/homebrew/Cellar/openjdk@17/17.0.12/libexec/openjdk.jdk/Contents/Home
export PATH="/opt/homebrew/opt/mysql/bin:$PATH"

# Reload .zshrc for the current session
source "$HOME/.zshrc"

# Additional setup steps (e.g., VS Code settings, etc.)
if [ -f ~/.vscode-zshrc ]; then
  echo "Loading VS Code Zsh configuration..."
  source ~/.vscode-zshrc
fi

# Final setup (e.g., Amazon Q setup)
echo "Setting up Amazon Q..."
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# Starship setup for the shell prompt
echo "Setting up Starship..."
curl -sS https://starship.rs/install.sh | sh

# Add Starship to .zshrc if it's not already there
if ! grep -q "starship init zsh" "$HOME/.zshrc"; then
  echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi

echo "macOS setup complete!"
