#!/bin/bash

# Install homebrew
if which brew > /dev/null; then
  echo "Homebrew is already installed."
else
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew bundle install
fi

# Set $ZDOTDIR
if grep -q "export ZDOTDIR" $HOME/.zprofile; then
  echo "\$ZDOTDIR is already set"
else
  echo "export ZDOTDIR=$HOME/.config/zsh" >> $HOME/.zprofile
  echo "\$ZDOTDIR has been set to $ZDOTDIR"
fi

# Symlink configs to ~/.config
if [ -d $HOME/.config ]; then
  echo "Symlinking configs to $HOME/.config"
  ln -s $(pwd)/*/ $HOME/.config
else
  echo "\$HOME/.config not found. Creating..."
  mkdir $HOME/.config
  echo "Symlinking configs to $HOME/.config"
  ln -s $(pwd)/*/ $HOME/.config
fi
