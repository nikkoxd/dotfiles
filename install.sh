#!/bin/bash

# Install Homebrew
if which brew > /dev/null; then
  echo "Homebrew is already installed."
else
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Brew Bundle
echo "Installing Brew Bundle"
if [ -L "$HOME/Brewfile" ]; then
  mv "$HOME/Brewfile" "$HOME/Brewfile.backup"
  echo "Existing Brewfile moved to $HOME/Brewfile.backup"
fi
ln -s "$(dirname "$0")/Brewfile" "$HOME"
brew bundle install

# Install colorz
pipx install colorz

# Install Pywalfox
pip3 install pywalfox
python3 -m pywalfox install

# Set $ZDOTDIR
if grep -q "export ZDOTDIR" "$HOME/.zprofile"; then
  echo "\$ZDOTDIR is already set"
else
  echo "export ZDOTDIR=$HOME/.config/zsh" >> "$HOME/.zprofile"
  echo "\$ZDOTDIR has been set to $ZDOTDIR"
fi

# Symlink configs to ~/.config
if [ -d "$HOME/.config" ]; then
  echo "Symlinking configs to $HOME/.config"
  ln -s "$(dirname "$0")/*/" "$HOME/.config"
else
  echo "\$HOME/.config not found. Creating..."
  mkdir "$HOME/.config"
  echo "Symlinking configs to $HOME/.config"
  ln -s "$(dirname "$0")/*/" "$HOME/.config"
fi
